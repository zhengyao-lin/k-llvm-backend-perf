
# Hubert Garavel -- quick-and-dirty REC translator to Scala

# this script imports the DIR, SCRIPT, ARGS_FILE, and CONSTANT_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	# properly capitalize the Scala object identifier
	# here, $0 = REC-SPEC <name>
	SPECIFICATION = tolower ($2)
	# note: the Scala manual recommends that objects names should be
	# capitalized as classes names, i.e., start with an upper-case letter;
	# but doing so creates a problem if an object named "Factorial" is
	# contained in a file named "factorial" (Scala emits an error message
	# of the form: "No such file or class on classpath: factorial"); for
	# this reason, the object identifiers will be entirely in lower case
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# variable CURRENT_SORT gives the name of the sort being processed,
	# together with its associated functions
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
	} else if ($1 == "OPNS") {
		print "\nobject " SPECIFICATION " {\n"
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (CURRENT_SORT != RESULT_SORT) {
			if (CURRENT_SORT != "-")
				print ""
			print "sealed abstract class " RESULT_SORT | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
		}
		ORS = ""
		print "  case class " $1 " " | CONVERT
		close (CONVERT)
		# remove <function> ":" from the current line
		sub (".*:", "", $0)
		# remove "->" <type> from the current line
		sub ("->.*", "", $0)
		# line = <type1> <type2> ... <typeN>
		if (NF == 0) {
			# CONVERT has added "()" already
		} else {
			print "("
			for (I = 1 ; I <= NF ; ++I) {
				print "rec_x" I ":" $I | CONVERT
				close (CONVERT)
				if (I < NF) print ", "
			}
			print ") "
		}
		print "extends " RESULT_SORT "\n" | CONVERT
		close (CONVERT)
		ORS = "\n"
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
		# does non-constructor $1 have strictly more than one argument?
		N_ARY = (NF - 2) > 3
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
		print "def " $1 >> ARGS_FILE
		if (NULLARY) {
			# the parentheses "()" will be added later by SCRIPT
			print " " >> ARGS_FILE
		} else {
			print " (" >> ARGS_FILE
			for (I = 3; I <= NF - 2; ++I) {
				print "rec_x" (I-2) ":" $I >> ARGS_FILE
				if (I < NF - 2)
					print ", " >> ARGS_FILE
			}
			print ")" >> ARGS_FILE
		}
		print ":" $NF " = " >> ARGS_FILE
		if (CONSTANT) {
			print "\n" >> ARGS_FILE
		} else {
			if (NULLARY) {
				print "0" >> ARGS_FILE
			} else {
				if (N_ARY)
					print "(" >> ARGS_FILE
				for (I = 3; I <= NF - 2; ++I) {
					print "rec_x" (I-2) >> ARGS_FILE
					if (I < NF - 2)
						print ", " >> ARGS_FILE
				}
				if (N_ARY)
					print ")" >> ARGS_FILE
			}
			print " match {\n" >> ARGS_FILE
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
		# here, we finish the last function
		if (CURRENT_FUNCTION != "-" && !CONSTANT)
			print "  }\n"
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		ORS = ""
		if ($1 != CURRENT_FUNCTION) {
			# here, we finish the current function
			if (CURRENT_FUNCTION != "-" && !CONSTANT)
				print "  }\n\n"
			# here, we begin a new function
			CURRENT_FUNCTION = $1
			CMD = "grep '^def " CURRENT_FUNCTION " ' " ARGS_FILE 
			PROFILE = ""
			CMD | getline PROFILE
			close (CMD)
			# is the current function nullary?
			NULLARY = PROFILE !~ ".*[(]rec_x1:.*"
			if (NULLARY) {
				sub (" :", ":", PROFILE)
			}
			# is the current function unary?
			UNARY = PROFILE !~ ".*, rec_x2:.*"
			# is the current function a constant?
			CONSTANT = PROFILE !~ ".* match .*"
			if (! CONSTANT) {
				# insert a "\n" after "=" and before "match"
				sub (" = ", " =\n  ", PROFILE)
			}
			print PROFILE | CONVERT
			close (CONVERT)
			if (! CONSTANT)
				print "\n"
		}
		# remove the function name
		sub ("^[A-Za-z0-9_]* ", "", $0)
		if (CONSTANT) {
			# remove "->"
			sub ("->[ ]*", "", $0)
			print $0 "\n" | CONVERT
			close (CONVERT)
		} else {
			if (NULLARY) {
				# insert a "0"
				sub ("^", "0 ", $0)
			} else if (UNARY) {
				# remove the parentheses around the function argument
				sub ("^[(]", "", $0)
				sub ("[)][ ]*-> ", " -> ", $0)
			}

			# check for the existence of a premiss (conditional equation)
			PREMISS = index ($0, " if ")
			if (PREMISS != 0) {
				# there is a premiss
				# $0 has the form: <left> -> <right> if <premiss>
				# $0 is then modified to get the following form:
				# <left> if <premiss> => <right>
				COND = substr ($0, PREMISS + 1) " ->"
				sub (" if .*$", "", $0)
				sub ("->", COND, $0)
			}
			# replace the "->" symbol of REC by the "=>" symbol of SCALA
			# (a space must be present after "->" to avoid confusion wit
			# the "-><-" and "->/<-" symbols)
			sub ("-> ", "=> ", $0)

			print "    case " $0 | CONVERT
			close (CONVERT)
		}
		print "\n"
		ORS = "\n"
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "def main (args:Array[String]):Unit = {"
		# to avoid the Java constraint that every method should be
		# small enough to be compiled into a 64-kbyte binary segment,
		# the main() method will be split into several functions
		# main1(), main2(), etc. such that each function has only
		# MAX_EXPRESSIONS_PER_FUNCTION instructions.
		MAX_EXPRESSIONS_PER_FUNCTION = 100
		NB_EXPRESSIONS = 0
		CURRENT_FUNCTION_NUMBER = 0
	} else if ($1 == "END-SPEC") {
		print "  }\n"
		print "}"
	} else {
		if (NB_EXPRESSIONS >= MAX_EXPRESSIONS_PER_FUNCTION) {
			++ CURRENT_FUNCTION_NUMBER
			print "  main" CURRENT_FUNCTION_NUMBER "();"
			# end of current function
			print "  }"
			print "def main" CURRENT_FUNCTION_NUMBER " ():Unit = {"
			NB_EXPRESSIONS = 0
		}
		print "  println (" $0 ")" | CONVERT
		close (CONVERT)
		++ NB_EXPRESSIONS
	}
}

