# Imad Larrada et Hubert Garavel -- quick-and-dirty REC translator to Opal

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# another pass to declare (overloaded) equality, inequality, and
	# printing functions for each sort
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		print ""
	} else if ($1 == "OPNS") {
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF

		if (RESULT_SORT != CURRENT_SORT) {
			SIGNATURE = ": " RESULT_SORT " ** " RESULT_SORT " -> bool"
			ANNOTATION = " :" RESULT_SORT "**" RESULT_SORT "->bool"

			# declaration of "=", "|=", and "print"
			print "FUN =  " SIGNATURE | CONVERT
			close (CONVERT)
			print "FUN |= " SIGNATURE | CONVERT
			close (CONVERT)
			print "FUN print : " RESULT_SORT " -> com[void]" | CONVERT
			close (CONVERT)
			print ""
			# catch-all equation for "="
			print "DEF _ =" ANNOTATION " _ == false\n" | CONVERT
			close (CONVERT)
			# equation defining "|="
			print "DEF rec_x |=" ANNOTATION " rec_y == not (rec_x = rec_y)\n" | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
		}

		CONSTRUCTOR = $1
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>

		# build the profiles (constructor name and list of arguments)
		# for the current constructor
		PROFILEx = CONSTRUCTOR
		PROFILEy = CONSTRUCTOR
		if (NF > 0) {
			# CONSTRUCTOR is not nullary
			PROFILEx = PROFILEx " ("
			PROFILEy = PROFILEy " ("
			for (I = 1; I <= NF; ++ I) {
				if (I < NF) {
					PROFILEx = PROFILEx "rec_x" I ", "
					PROFILEy = PROFILEy "rec_y" I ", "
				} else {
					PROFILEx = PROFILEx "rec_x" I ")"
					PROFILEy = PROFILEy "rec_y" I ")"
				}
			}
		}

		# definition of the "=" function for this constructor
		ORS = ""
		print "DEF " PROFILEx " =" ANNOTATION " " PROFILEy " == " | CONVERT
		close (CONVERT)
		if (NF == 0) {
			# CONSTRUCTOR is nullary
			print "true"
		} else {
			# CONSTRUCTOR has arguments
			for (I = 1; I <= NF; ++ I) {
				print "(rec_x" I " = rec_y" I ")"
				if (I < NF)
					printf " and "
			}
		}
		print "\n\n"
		ORS = "\n"

		# definition of the "print" function for this constructor
		ORS = ""
		print "DEF print (" PROFILEx ") ==" | CONVERT
		close (CONVERT)
		if (NF == 0) {
			# CONSTRUCTOR is nullary
			print " write (stdOut, \"" CONSTRUCTOR "\")\n" | CONVERT
			close (CONVERT)
		} else {
			# CONSTRUCTOR has arguments
			print "\n"
			print "    (write (stdOut, \"" CONSTRUCTOR "\");\n" | CONVERT
			close (CONVERT)
			print "    write (stdOut, \" (\");\n"
			for (I = 1; I <= NF; ++ I) {
				print "    print (rec_x" I ");\n"
				if (I < NF)
					print "    write (stdOut, \", \");\n"
			}
			print "    write (stdOut, \")\"))\n"
		}
		print "\n"
		ORS = "\n"
	}
}

/^OPNS$/,/^VARS$/ {
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		print ""
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print "FUN " $1 " : " | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		# here, $0 = <type1> <type2> ... <typeN> -> <type>
		# (assert: NF >= 2)

		# print the types of the arguments and result of function $1
		if (NF == 2) {
			# nullary function (i.e., constant in Opal terminology)
			# the arrow "->" must not be printed
			print $NF | CONVERT
			close (CONVERT)
		} else {
			# function with at least one argument
			for (I = 1 ; I <= NF ; ++I) {
				print $I | CONVERT
				close (CONVERT)
				if ((NF > 3) && (I < NF - 2)) {
					print " **"
				}
				print " "
			}
		}
		print "\n"
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		CURRENT_FUNCTION = "-"
		CURRENT_LHS = "-"
	} else if ($1 == "EVAL") {
		if (CURRENT_LHS != "-") {
			# close the last function conditional definition
			print "    FI"
		}
	} else {
		# here, $0 = $1 ... (i.e., an equation that defines function $1)
		ORS = ""

		# compute the current left-hand side
		MIDDLE = index ($0, " -> ")
		LHS = substr ($0, 1, MIDDLE)

		if ((CURRENT_LHS != "-") && (LHS != CURRENT_LHS)) {
			# close the previous function conditional definition
			print "    FI\n"
		}

		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		
		if ($1 != CURRENT_FUNCTION) {
			# here, we begin a new function
			if (CURRENT_FUNCTION != "-")
				print "\n"
			CURRENT_FUNCTION = $1
		}

		if (PREMISS == 0) {
			# here, $0 has the form: <left> -> <right>
			sub ("[ ]*->[ ]*", " == ", $0)
			# here, $0 has the form: 
			print "DEF " $0 "\n" | CONVERT
			close (CONVERT)
			CURRENT_LHS = "-"
		} else {
			# here, $0 has the form: <left> -> <right> if <premiss>
			GUARD = substr ($0, PREMISS + 4)
			sub (" if .*", "", $0)
			# here, $0 has the form: <left> -> <right>
			COND = "IF (" GUARD ") THEN "
			sub ("[ ]*->[ ]*", " == " COND, $0)
			# here, $0 has the form: <left> == IF <premiss> THEN <right>
			if (CURRENT_LHS != LHS) {
				sub (" == ", " ==\n    ", $0)
				print  "DEF " $0 "\n" | CONVERT
				close (CONVERT)
				CURRENT_LHS = LHS
			} else {
				sub (".*== ", "", $0)
				# here, $0 has the form: IF <premiss> THEN <right>
				print "    " $0 "\n" | CONVERT
				close (CONVERT)
			}
		}
		ORS = "\n"
	}
}

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "\nDEF main =="
	} else if ($1 == "END-SPEC") {
		print "    exit (0)"
	} else {
		# print the result
		print "    print (" $0 ");" | CONVERT
		close (CONVERT)
		print "    write (stdOut, newline);"
	}
}


