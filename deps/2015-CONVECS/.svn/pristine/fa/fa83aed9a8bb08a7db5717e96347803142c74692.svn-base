
# Mohammad-Ali Tabikh -- quick-and-dirty REC translator to SML (adapted from the one for OCAML)

# this script imports the DIR, SCRIPT, ARGS_FILE and TYPE_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^CONS$/,/^OPNS$/ {
	# another pass to declare a printing function for each sort
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		print "\n"
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT == "-")
				print "\nfun "
			else
				print "\n\nand "
			print "print_" RESULT_SORT " (rec_x:" RESULT_SORT ") =\n" | CONVERT
			close (CONVERT)
			print "   case rec_x of\n"
			CURRENT_SORT = RESULT_SORT
			FIRST_ARGUMENT = 1
		}
		CONSTRUCTOR = $1
		if (FIRST_ARGUMENT == 1) {
			print "   "
			FIRST_ARGUMENT = 0
		} else {
			print " | "
		}
		print CONSTRUCTOR | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		# print the constructor arguments
		if (NF == 0) {
			# nothing
		} else if (NF == 1) {
			print " rec_x1"
		} else {
			print " ("
			for (I = 1; I <= NF; ++ I) {
				print "rec_x" I
				if (I < NF)
					print ", "
			}
			print ")"
		}
		print " => (\n"
		print "      print \"" CONSTRUCTOR "\"" | CONVERT
		close (CONVERT)
		if (NF > 0) {
			# the constructor has at least one argument
			print ";\n"
			print "      print \" (\";\n"
			for (I = 1; I <= NF; ++ I) {
				print "      print_" $I " rec_x" I ";\n"
				if (I < NF)
					print "       print \",\";\n"
			}
			print "      print \")\""
		}
		print "\n   )"
	}
} 

/^OPNS$/,/^VARS$/ {
	# compute and store the profile of non-constructors into ARGS_FILE
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		# not to be forgotten, otherwise the last line is lost
		close (ARGS_FILE)
	} else {
		# here, $0 = <non-constructor> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print $1 >> ARGS_FILE
		if (NF - 2 >= 3) {
			# the non-constructor has at least one argument
			print " (" >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) ":" $I >> ARGS_FILE
				if (I < NF - 2) {
					print ", " >> ARGS_FILE
				}
			}
			print ")" >> ARGS_FILE
		}
		print " : " $NF " = " >> ARGS_FILE
		if (NF - 2 >= 3) {
			# non-constructor $1 has at least one argument
			print "case (" >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) >> ARGS_FILE
				if (I < NF - 2)
					print ", " >> ARGS_FILE
			}
			print ") of" >> ARGS_FILE
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
		INSIDE_LET_REC = 0
	} else if ($1 == "EVAL") {
		if (INSIDE_LET_REC == 1) {
			# for additional safety
			INSIDE_LET_REC = 0
		}
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		ORS = ""
		if ($1 != CURRENT_FUNCTION) {
			# here, we begin a new function
			CURRENT_FUNCTION = $1
			CMD = "grep '^" CURRENT_FUNCTION " ' " ARGS_FILE 
			PROFILE = ""
			CMD | getline PROFILE
			close (CMD)
			# is the function nullary?
			NULLARY = PROFILE !~ ".* case .*"
			# is the function defined using conditional rules?
			# assuming that the 1st rule gives the answer
			PREMISS = index ($0, " if ")
			if (NULLARY) {
				if (PREMISS) {
					if (INSIDE_LET_REC == 0) {
						print "\nfun "
						INSIDE_LET_REC = 1
					} else {
						print "\nfun "
					}
				} else {
					if (INSIDE_LET_REC == 1) {
						# first, close the "fun" definition
						print ""
						INSIDE_LET_REC = 0
					}
					# then, start a "let" definition
					print "\nfun "
				}
				print PROFILE | CONVERT
				close (CONVERT)
				if (PREMISS)
					print "\n   case 0 of\n"
			} else {
				if (INSIDE_LET_REC == 0) {
					print "\nfun "
					INSIDE_LET_REC = 1
				} else {
					print "\nand "
				}
				sub (" case ", "\n   case ", PROFILE)
				print PROFILE "\n" | CONVERT
				close (CONVERT)
			}
			FIRST_ARGUMENT = 1
		}
		# remove the function name and its parentheses (if any)
		sub ("^[A-Za-z0-9_]* ", "", $0)
		if (substr ($0, 1, 1) == "(") {
			# this parenthesis is not preceded by "if"
			#sub ("[(]", "", $0)
			sub ("[)][ ]*->", ") ->", $0)
		}

		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		if (PREMISS != 0) {
			# there is a premiss
			# $0 has the form: <left> -> <right> if <premiss>
			# $0 is then modified to get the following form:
			# <left> where <premiss> -> <right>
			COND = "where " substr ($0, PREMISS + 4) " =>"
			sub ("->", COND, $0)
			sub (" if .*", "", $0)
		}

		if (NULLARY) {
			if (PREMISS) {
				if (FIRST_ARGUMENT == 1) {
					print "     "
					FIRST_ARGUMENT = 0
				} else {
					print "   | "
				}
				print "0 "
			} else
				sub ("-> ", "", $0)
		} else {
			sub ("-> ", "=> ", $0)
			if (FIRST_ARGUMENT == 1) {
				print "     "
				FIRST_ARGUMENT = 0
			} else {
				print "   | "
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
		print "\nfun main () = ("
	} else if ($1 == "END-SPEC") {
		print "   OS.Process.exit (OS.Process.success)"    # exit instruction
		print ")\n"
		print "val _ = main ()\n"
		print "end"
	} else {
		# infer the type of the expression from its top-level function $1
		CMD = "sh " DIR "/rec_type -check " $1 " " TYPE_FILE
		CMD | getline SORT
		close (CMD)

		# remove extra spaces in the expression
		gsub (" [ ]*", " ", $0)

		# print the result
		ORS = ""
		print "   print_" SORT " ("
		print $0 | CONVERT
		close (CONVERT)
		ORS = "\n"
		print ");"
		print "   print \"\\n\";"
	}
}

