
# Hubert Garavel and Imad Larrada -- quick-and-dirty REC translator to Ocaml

# this script imports the DIR, SCRIPT, TYPE_FILE, and ARGS_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
	CONVERT_EXP = "sh " SCRIPT " -exp"
}

/^CONS$/,/^OPNS$/ {
	# another pass to declare a printing function for each sort
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		print ";;\n"
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT == "-")
				print "\nlet rec "
			else
				print "\nand "
			print "print_" RESULT_SORT " (rec_x:" RESULT_SORT ") =\n" | CONVERT
			close (CONVERT)
			print "   match rec_x with\n"
			CURRENT_SORT = RESULT_SORT
		}
		CONSTRUCTOR = $1
		print "   | " CONSTRUCTOR | CONVERT
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
		print " ->\n"
		print "      print_string \"" CONSTRUCTOR "\"" | CONVERT
		close (CONVERT)
		if (NF == 0) 
			print "\n"
		else {
			# FUNCTION has arguments
			print ";\n"
			print "      print_string \" (\";\n"
			for (I = 1; I <= NF; ++ I) {
				print "      print_" $I " rec_x" I ";\n"
				if (I < NF)
					print "      print_string \",\";\n"
			}
			print "      print_string \")\"\n"
		}
	}
} 

/^OPNS$/,/^VARS$/ {
	# compute and store the profile of non-constructors into $ARGS_FILE
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		# not to be forgotten, otherwise the last line is lost
		close (ARGS_FILE)
	} else {
		# here, $0 = <non-constructor> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print $1 " " >> ARGS_FILE
		for (I = 3; I <= NF - 2; ++I) {
			print "(rec_x" (I-2) ":" $I ") " >> ARGS_FILE
		}
		print ": " $NF " = " >> ARGS_FILE
		if (NF - 2 >= 3) {
			# non-constructor $1 has at least one argument
			print "match " >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) >> ARGS_FILE
				if (I < NF - 2)
					print ", " >> ARGS_FILE
			}
			print " with" >> ARGS_FILE
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
			print ";;"
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
			NULLARY = PROFILE !~ ".* match .*"
			# is the function defined using conditional rules?
			# assuming that the 1st rule gives the answer
			PREMISS = index ($0, " if ")
			if (NULLARY) {
				if (PREMISS) {
					if (INSIDE_LET_REC == 0) {
						print "\nlet rec "
						INSIDE_LET_REC = 1
					} else {
						print "\nand "
					}
				} else {
					if (INSIDE_LET_REC == 1) {
						# first, close the "let rec" definition
						print ";;\n"
						INSIDE_LET_REC = 0
					}
					# then, start a "let" definition
					print "\nlet "
				}
				print PROFILE | CONVERT
				close (CONVERT)
				if (PREMISS)
					print "\n   match 0 with\n"
			} else {
				if (INSIDE_LET_REC == 0) {
					print "\nlet rec "
					INSIDE_LET_REC = 1
				} else {
					print "\nand "
				}
				sub (" match ", "\n   match ", PROFILE)
				print PROFILE "\n" | CONVERT
				close (CONVERT)
			}
		}

		# remove the function name and its parentheses (if any)
		sub ("^[A-Za-z0-9_]* ", "", $0)
		if (substr ($0, 1, 1) == "(") {
			# this parenthesis is not preceded by "if"
			sub ("[(]", "", $0)
			sub ("[)][ ]*->", " ->", $0)
		}

		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		if (PREMISS != 0) {
			# there is a premiss
			# $0 has the form: <left> -> <right> if <premiss>
			# $0 is then modified to get the following form:
			# <left> when <premiss> -> <right>
			COND = "when " substr ($0, PREMISS + 4) " ->"
			sub ("->", COND, $0)
			sub (" if .*", "", $0)
		}

		if (NULLARY) {
			if (PREMISS)
				print "   | 0 "
			else
				sub ("-> ", "", $0)
		} else {
			print "   | "
		}
		print $0 | CONVERT_EXP
		close (CONVERT_EXP)
		if (NULLARY && !PREMISS) {
			print " ;;\n"
		} else {
			print "\n"
		}
		ORS = "\n"
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "\nlet main () ="
	} else if ($1 == "END-SPEC") {
		print "   exit 0"
		print ";;\n"
		print "main ()"
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
		print $0 | CONVERT_EXP
		close (CONVERT_EXP)
		ORS = "\n"
		print ");"
		print "   print_newline ();"
		print "   flush stdout;"
	}
}

