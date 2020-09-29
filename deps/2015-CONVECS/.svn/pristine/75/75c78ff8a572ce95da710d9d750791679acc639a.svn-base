
# Hubert Garavel -- quick-and-dirty REC translator to Tom

# this script imports the DIR, SCRIPT, ARGS_FILE, and CONSTANT_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
	CAPITALIZE = "sh " DIR "/rec_upper "
}

/^REC-SPEC / {
	# here, $0 = REC-SPEC <name>
	print "// TOM-B"
	print "import " tolower($2) ".term.*;"
	print "import " tolower($2) ".term.types.*;"
	# the class name is also translated to lower case because it must
	# match the case of the filename and the REC filenames are lower-case
	ORS = ""
	print "public class "
	print tolower($2) | CAPITALIZE
	close (CAPITALIZE)
	print " {\n"
	ORS = "\n"
	print "  %gom{"
	print "    module Term"
	# the following line is needed for the variables rec_zero
	print "    imports int"
	print "    abstract syntax"
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	if ($1 == "CONS") {
		# variable CURRENT_SORT gives the name of the sort being
		# processed, together with its associated constructors
		CURRENT_SORT = "-"
		J = 0
	} else if ($1 == "OPNS") {
		print "  }\n"
	} else {
		# pass over the list of constructors
		# here, $0 = <constructor> : <type1> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (CURRENT_SORT != RESULT_SORT) {
			print "    " RESULT_SORT " ="
			CURRENT_SORT = RESULT_SORT
			J = 0
		}
		ORS = ""
		print "      | " $1 "("
		# remove <constructor> ":" from the current line
		sub (".*:", "", $0)
		# remove "->" <type> from the current line
		sub ("->.*", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		if (NF > 0)
			++J
		for (I = 1 ; I <= NF ; ++I) {
			print "rec_x" I "_" J ":" $I
			if (I < NF) print ", "
		}
		print ")\n"
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
		print "private static " $NF " " $1 " (" >> ARGS_FILE
		for (I = 3; I <= NF - 2; ++I) {
			print $I " rec_x" (I-2) >> ARGS_FILE
			if (I < NF - 2)
				print ", " >> ARGS_FILE
		}
		print ") {" >> ARGS_FILE
		if (CONSTANT) {
			print "\n" >> ARGS_FILE
		} else {
			print " %match (" >> ARGS_FILE
			if (NULLARY) {
				print "int 0" >> ARGS_FILE
			} else {
				for (I = 3; I <= NF - 2; ++I) {
					print $I " rec_x" (I-2) >> ARGS_FILE
					if (I < NF - 2)
						print ", " >> ARGS_FILE
				}
			}
			print ") {\n" >> ARGS_FILE
		}
		ORS = "\n"
	}
}

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		CURRENT_FUNCTION = "-"
	} else if ($1 == "EVAL") {
		if (CURRENT_FUNCTION != "-") {
			# here, we finish the last function
			if (! CONSTANT) {
				print "    }"
				print "    throw new RuntimeException (\"incomplete match in function " CURRENT_FUNCTION "()\");"
			 }
			print "  }\n"
		}
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		if ($1 != CURRENT_FUNCTION) {
			# here, we finish the current function
			if (CURRENT_FUNCTION != "-") {
				if (! CONSTANT) {
					print "    }"
					print "    throw new RuntimeException (\"incomplete match in function " CURRENT_FUNCTION "()\");"
				}
				print "  }\n"
			}
			# here, we begin a new function
			CURRENT_FUNCTION = $1
			CMD = "grep '^private static [A-Za-z0-9]* " CURRENT_FUNCTION " ' " ARGS_FILE 
			PROFILE = ""
			CMD | getline PROFILE
			close (CMD)
			# is the current function nullary?
			NULLARY = PROFILE !~ ".* rec_x1.*"
			# is the current function a constant?
			CONSTANT = PROFILE !~ ".* %match .*"

			# insert a "\n" before "%match"
			sub (" { ", " {\n    ", PROFILE)
			print "  " PROFILE
		}
		# remove the function name
		sub ("^[A-Za-z0-9_]* ", "", $0)
		if (CONSTANT) {
			# remove "->" with "return"
			sub ("^[ ]*->[ ]*", "", $0)
			print "    return `" $0 ";" | CONVERT
			close (CONVERT)
		} else {
			if (NULLARY) {
				sub ("^-> ", "rec_zero -> { return `", $0)
			} else {
				# remove the parentheses around the function
				# argument and insert "return"
				sub ("^[(]", "", $0)
				sub ("[)][ ]*-> ", " -> { return `", $0)
			}

			# check for the existence of a premiss (conditional equation)
			PREMISS = index ($0, " if ")
			if (PREMISS != 0) {
				# there is a premiss
				# $0 has the form: <left> -> return <right> if <premiss>
				# $0 is then modified to get the following form:
				# <left> if <premiss> -> return <right>
				COND = substr ($0, PREMISS + 1) ") ->"
				sub (" if .*$", "", $0)
				sub ("->", COND, $0)
				# remove "->" (not in "-><-" or "->/<-")
				sub ("[ ]*->[^</]", " ", $0)
				# replace "if" by "-> { if"
				sub (" if ", " -> { if (`", $0)
				# add a backquote after each "-><-"
				gsub ("-><-[ ]*", "-><- `", $0)
				# add a backquote after each "->/<-"
				gsub ("->/<-[ ]*", "->/<- `", $0)
				# add a backquote after each "and if"
				gsub ("and-if[ ]*", "and-if `", $0)
				
			}
			ORS = ""
			print "      " $0 "; }" | CONVERT
			close (CONVERT)
			if (PREMISS != 0) {
				print " }"
			}
			print "\n"
			ORS = "\n"
		}
	}
}

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		# to avoid the Java constraint that every method should be
		# small enough to be compiled into a 64-kbyte binary segment,
		# the main() method will be split into several functions
		# main1(), main2(), etc. such that each function has only
		# MAX_EXPRESSIONS_PER_FUNCTION instructions.
		# Note : a value of 100 proved to be too large for add32.rec
		MAX_EXPRESSIONS_PER_FUNCTION = 90
		NB_EXPRESSIONS = 0
		CURRENT_FUNCTION_NUMBER = 0
		print "  public static void main (String[] args) {"
	} else if ($1 == "END-SPEC") {
		# end of current function
		print "  }"
		# end of class
		print "}"
	} else {
		if (NB_EXPRESSIONS >= MAX_EXPRESSIONS_PER_FUNCTION) {
			++ CURRENT_FUNCTION_NUMBER
			print "  main" CURRENT_FUNCTION_NUMBER "();"
			# end of current function
			print "  }"
			print "  static void main" CURRENT_FUNCTION_NUMBER " () {"
			NB_EXPRESSIONS = 0
		}
		print "    System.out.println (`" $0 ");" | CONVERT
		close (CONVERT)
		++ NB_EXPRESSIONS
	}
}

