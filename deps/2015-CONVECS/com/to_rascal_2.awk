
# Imad Larrada et Hubert Garavel -- quick-and-dirty REC translator to Rascal

# this script imports the DIR, SCRIPT, TYPE_FILE, and ARGS_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
	CONVERT_PAT = "sh " SCRIPT " -pat"
}

/^REC-SPEC / {
	# here, $0 = REC-SPEC <name>
	print "module " tolower ($2)
	print "import IO;\n"
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		print ";\n\n"
		ORS = "\n"
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT != "-") 
				print ";\n\n" 
			print "data " RESULT_SORT " = " | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
			FIRST = 1
			J = 0
		}
		# $1 is a constructor
		if (FIRST == 1) {
			FIRST = 0
		} else {
			print " | "
		}
		print $1 | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		if (NF == 0) {
			# the constructor is nullary: the "()" have been added
			# already by CONVERT
		} else {
			# declare each constructor argument and its type
			++ J
			print " ("
			for (I = 1 ; I <= NF ; ++ I) {
				print $I " rec_x" I "_" J | CONVERT
				close (CONVERT)
				if (I < NF) print ", "
			}
			print ")"
		}
	}
}

/^OPNS$/,/^VARS$/ {
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

		# computing the type SORT of $1
		CMD = "sh " DIR "/rec_type -check " $1 " " TYPE_FILE
		CMD | getline SORT
		close (CMD)

		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		
		if ($1 != CURRENT_FUNCTION) {
			# here, we begin a new function
			if (CURRENT_FUNCTION != "-")
				print "\n"
			CURRENT_FUNCTION = $1
		}

		if (PREMISS != 0) {
			# here, $0 has the form: <left> -> <right> if <premiss>
			GUARD = substr ($0, PREMISS + 4)
			sub (" if .*", "", $0)
			# here, $0 has the form: <left> -> <right>
			COND = "{ if (" GUARD ") return "
			sub ("->[ ]*", COND, $0)
			# here, $0 has the form: <left> { if <premiss> return <right>
			print SORT | CONVERT
			close (CONVERT)
			print " " $0 "; else fail; }" | CONVERT_PAT
			close (CONVERT_PAT)
		} else {
			# here, $0 has the form: <left> -> <right>
			sub ("-> ", "= ", $0)
			print SORT | CONVERT
			close (CONVERT)
			print " " $0 ";" | CONVERT_PAT
			close (CONVERT_PAT)
		}
		print "\n"
		ORS = "\n"
	}
}

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "\nvoid main([]) { // entry point for the RASCAL interpreter"
		print "  main();"
		print "}\n"
		print "int main() { // entry point for the RASCAL compiler"
		# to avoid the Java constraint that every method should be
		# small enough to be compiled into a 64-kbyte binary segment,
		# the main() method will be split into several functions
		# main1(), main2(), etc. such that each function has only
		# MAX_EXPRESSIONS_PER_FUNCTION instructions.
		MAX_EXPRESSIONS_PER_FUNCTION = 100
		NB_EXPRESSIONS = 0
		CURRENT_FUNCTION_NUMBER = 0
	} else if ($1 == "END-SPEC") {
		if (CURRENT_FUNCTION_NUMBER == 0) {
			# the main() function returns an integer
			print "  return 0;"
		}
		print "}"
	} else {
		# print the result
		if (NB_EXPRESSIONS >= MAX_EXPRESSIONS_PER_FUNCTION) {
			++ CURRENT_FUNCTION_NUMBER
			print "  main" CURRENT_FUNCTION_NUMBER "();"
			# end of current function
			if (CURRENT_FUNCTION_NUMBER == 1) {
				# the main() function returns an integer
				print "  return 0;"
			}
			print "}"
			print "void main" CURRENT_FUNCTION_NUMBER " () {"
			NB_EXPRESSIONS = 0
		}
		print "  println (" $0 ");" | CONVERT
		close (CONVERT)
		++ NB_EXPRESSIONS
	}
}

