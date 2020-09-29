
# Hubert Garavel -- quick-and-dirty REC translator to LNT

# this script imports the DIR, SCRIPT, ARGS_FILE, CONSTANT_FILE, and
# VARS_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	print "module " $2 " is\n"
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
	} else if ($1 == "OPNS") {
		ORS = "\n"
		print "\nwith \"==\", \"!=\""
		print "end type\n"
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			# beginning of a new sort
			if (CURRENT_SORT != "-") {
				ORS = "\n"
				print "\nwith \"==\", \"!=\""
				print "end type\n"	
			}
			print "type " RESULT_SORT " is "
			ORS = ""
			CURRENT_SORT = RESULT_SORT
			# reset the constructor number
			I = 0
		} else {
			print ",\n"
		}
		# $1 is a constructor
		ORS = ""
		print "   " $1
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		if (NF == 0) {
			# the constructor is nullary
		} else {
			# declare each constructor argument and its type
			++ I
			print " ("
			for (J = 1 ; J <= NF ; ++ J) {
				print "rec_x" I "_" J ":" $J
				if (J < NF) print ", "
			}
			print ")"
		}
	}
}

/^OPNS$/,/^VARS$/ {
	# second pass to compute the profile of non-constructors into $ARGS_FILE
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		# not to be forgotten, otherwise the last line is lost
		close (ARGS_FILE)
	} else {
		# line = <non-constructor> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		# does non-constructor $1 have zero argument?
		NULLARY = (NF - 2) < 3
		# is non-constructor $1 a constant?
		CONSTANT = 0
		if (NULLARY) {
			CMD = "sh " DIR "/rec_constant -check " $1 " " CONSTANT_FILE
			CMD | getline NB_RULES
			close (CMD)
			if (NB_RULES == 1)
				CONSTANT = 1
		}
		# declare non-constructor $1
		print "function " $1 >> ARGS_FILE
		if (NULLARY) {
			# "()" after nullary functions is optional in LNT
		} else {
			print " (" >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) ":" $I >> ARGS_FILE
				if (I < NF - 2)
					print ", " >> ARGS_FILE
			}
			print ")" >> ARGS_FILE
		}
		print " : " $NF " is" >> ARGS_FILE
		if (CONSTANT) {
			print "\n" >> ARGS_FILE
		} else if (NULLARY) {
			print " case 0 of NAT in\n" >> ARGS_FILE
		} else {
			print " case " >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) >> ARGS_FILE
				if (I < NF - 2)
					print ", " >> ARGS_FILE
			}
			print " in\n" >> ARGS_FILE
		}
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		CURRENT_FUNCTION = "-"
	} else if ($1 == "EVAL") {
		if (CURRENT_FUNCTION != "-") {
			# here, we finish the last function
			ORS = ""
			if (! CONSTANT)
				print "   end case\n"
			print "end function\n\n"
			ORS = "\n"
		}
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		ORS = ""
		if ($1 != CURRENT_FUNCTION) {
			# here, we finish the current function
			if (CURRENT_FUNCTION != "-") {
				if (! CONSTANT)
					print "   end case\n"
				print "end function\n\n"
			}
			# here, we begin a new function
			CURRENT_FUNCTION = $1
			CMD = "grep '^function " CURRENT_FUNCTION " ' " ARGS_FILE 
			PROFILE = ""
			CMD | getline PROFILE
			close (CMD)
			# is the current function nullary?
			NULLARY = PROFILE !~ ".*[(]rec_x1:.*"
			# is the current function a constant ?
			CONSTANT = PROFILE !~ ".* case .*"
			if (CONSTANT) {
				print PROFILE "\n"
			} else {
				# insert a "\n" after "is" and before "case"
				sub (" is ", " is\n   ", PROFILE)
				print PROFILE "\n"
				FIRST_RULE = 1
				# extraction of the local "case" variables, if any
				CMD = "grep '^" CURRENT_FUNCTION " ' " VARS_FILE " | sed -e 's/^" CURRENT_FUNCTION " //' | tr '\n' ',' | sed -e 's/,$//' | sed -e 's/,/, /g'"
				PROFILE = ""
				CMD | getline PROFILE
				close (CMD)
				if (PROFILE != "") {
					print "   var " PROFILE " in\n"
				}
			}
		}
		# remove the function name
		sub ("^[A-Za-z0-9_]* ", "", $0)
		if (CONSTANT) {
			# "return"
			sub ("[ ]*->[ ]*", "", $0)
			print "   return " $0 "\n" | CONVERT
			close (CONVERT)
			ORS = "\n"
		} else {
			if (NULLARY) {
				# insert "any" and "return"
				sub ("^", "any ", $0)
				sub ("[ ]*-> ", " -> return ", $0)
			} else {
				# remove the parentheses around the function argument
				sub ("^[(]", "", $0)
				sub ("[)][ ]*-> ", " -> return ", $0)
			}
			# is the current equation conditional?
			PREMISS = index ($0, " if ")
			if (PREMISS != 0) {
				# there is a premiss
				# replace "if" by "where"
				sub (" if ", " where (", $0)
				# $0 has the form: <left> -> return <right> where <premiss>
				# $0 is then modified to get the following form:
				# <left> where <premiss> -> return <right>
				COND = substr ($0, PREMISS + 1) ") ->"
				sub (" where .*$", "", $0)
				sub ("->", COND, $0)
			}
			print "   "
			if (FIRST_RULE == 1) {
				print "  "
				FIRST_RULE = 0
			} else {
				print "| "
			}
			print $0 "\n" | CONVERT
			close (CONVERT)
			ORS = "\n"
		}
	}
}

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "process MAIN [PRINT:any] is"
	} else if ($1 == "END-SPEC") {
		print "   stop"
		print "end process\n"
		print "end module"
	} else {
		print "   PRINT (" $0 ");"
	}
}

