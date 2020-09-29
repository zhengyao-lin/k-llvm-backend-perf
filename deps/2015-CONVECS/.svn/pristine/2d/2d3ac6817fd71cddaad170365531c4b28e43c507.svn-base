
# Hubert Garavel -- quick-and-dirty REC translator to Clean

# this script imports the DIR, SCRIPT, and ARGS_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^CONS$/,/^OPNS$/ {
	# another pass to declare a printing function for each sort
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			print "\ninstance <<< "
			print RESULT_SORT | CONVERT
			close (CONVERT)
			print " where\n"
			CURRENT_SORT = RESULT_SORT
		}
		CONSTRUCTOR = $1
		print "   (<<<) rec_file ("
		print CONSTRUCTOR | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		# print the constructor arguments (if any)
		for (I = 1; I <= NF; ++ I) {
			print " rec_x" I
		}
		print ") = rec_file <<< "
		print "\"" CONSTRUCTOR "\"" | CONVERT
		close (CONVERT)
		for (I = 1; I <= NF; ++ I) {
			if (I == 1) {
				print " <<< \" (\""
			}
			print " <<< rec_x" I
			if (I < NF) {
				print " <<< \", \""
			} else {
				print " <<< \")\""
			}
		}
		print "\n"
	}
} 

/^OPNS$/,/^VARS$/ {
	# second pass to compute the profile of non-constructors into $ARGS_FILE
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		# not to be forgotten, otherwise the last line is lost
		close (ARGS_FILE)
	} else {
		# here, $0 = <non-constructor> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print $1 " :: " >> ARGS_FILE
		sub ("-> ", "", $0)
		for (I = 3; I <= NF; ++I) {
			if (I < NF) {
				# the "!" symbol denotes strictness of argument
				print "!" >> ARGS_FILE
			}
			print $I >> ARGS_FILE
			if (I < NF - 1) {
				# argument types are separated by spaces
				print " " >> ARGS_FILE
			} else if (I == NF - 1) {
				# result type is preceded by "->" (unless
				# in the case of a constant function)
				print " -> " >> ARGS_FILE
			}
		}
		print "\n" >> ARGS_FILE
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		CURRENT_FUNCTION = "-"
	} else if ($1 == "EVAL") {
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		ORS = ""
		if ($1 != CURRENT_FUNCTION) {
			# here, we begin a new function
			CURRENT_FUNCTION = $1
			CURRENT_PATTERN = "-"
			print "\n"
			CMD = "grep '^" CURRENT_FUNCTION " ' " ARGS_FILE
			CMD | getline PROFILE
			close (CMD)
			print PROFILE "\n" | CONVERT
			close (CONVERT)
		}
		PREMISS = index ($0, " if ")
		if (PREMISS == 0) {
			# there is no premiss
			sub ("->", "=", $0)
		} else {
			# there is a premiss
			# $0 has the form: <left> -> <right> if <premiss>
			# $0 is then modified to get the following form:
			# <left> | <premiss> = <right>
			COND = "| (" substr ($0, PREMISS + 4) ") = "
			sub ("->", COND, $0)
			sub (" if .*", "", $0)
			# then <left> is removed from $0 if it is identical
			# to the pattern of the previous equation
			END_OF_PATTERN = index ($0, "|")
			PATTERN = substr ($0, 1, END_OF_PATTERN - 1)
			if (PATTERN == CURRENT_PATTERN) {
				# PATTERN must be removed from $0
				sub (".*\|", "|", $0)
			} else {
				CURRENT_PATTERN = PATTERN
				# CONVERT will insert a "\n" before "|"
			}
		}
		print $0 | CONVERT
		close (CONVERT)
		print "\n"
		ORS = "\n"
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print ""
		print "Start :: *World -> *World"
		print "Start world"
		print "   # (console, world) = stdio world"
	} else if ($1 == "END-SPEC") {
		print "   = snd (fclose console world)"
	} else {
		ORS = ""
		print "   # console = console <<< "
		print "(" $0 | CONVERT
		# this extra initial "(" is removed by CONVERT
		close (CONVERT)
		ORS = "\n"
		print " <<< \"\\n\""
	}
}


