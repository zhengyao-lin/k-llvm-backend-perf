
# Hubert Garavel -- quick-and-dirty REC translator to Tom

# this script imports the DIR, SCRIPT, and FUNC_FILE variables

BEGIN {
	CONVERT = "sh " SCRIPT
	CAPITALIZE = "sh " DIR "/rec_upper "
	# set the following variable to 1 to print CPU time (optional)
	TIME_MEASUREMENT = 0
}

/^REC-SPEC / {
	# here, $0 = REC-SPEC <name>
	print "// TOM-A"
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
	print "    abstract syntax"
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^VARS$/ {
	# in a first phase, all constructor and non-constructor definitions
	# are accumulated in auxiliary file FUNC_FILE because all of them
	# must be declared together in Tom
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
		# second pass over the list of constructors/non-constructors
		# close and sort FUNC_FILE
		close (FUNC_FILE)
		CMD = "sort -k 1,1 " FUNC_FILE " > " FUNC_FILE ".aux ; mv " FUNC_FILE ".aux " FUNC_FILE
		system (CMD)
		# variable CURRENT_SORT gives the name of the sort being processed,
		# together with its associated constructor and non-constructors
		CURRENT_SORT = "-"
		J = 0
		# read FUNC_FILE line by line
		while (1) {
			RESULT = getline < FUNC_FILE
			if (RESULT == -1) {
				# read failure
				print "*** problem reading FUNC_FILE"
				exit 1
			} else if (RESULT == 0) {
				# end of file
				close (FUNC_FILE)
				break
			} else {
				# process the current line, number by number
				# remove the initial "type :: "
				sub (".* :: ", "", $0)
				# process function declaration
				RESULT_SORT = $NF
				if (CURRENT_SORT != RESULT_SORT) {
					print "    " RESULT_SORT " ="
					CURRENT_SORT = RESULT_SORT
					J = 0
				}
				ORS = ""
				print "      | " $1 "("
				# remove <function> ":" from the current line
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
	} else {
		# first pass over the list of constructors/non-constructors
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		print $NF " :: " $0 >> FUNC_FILE
	}
} 

/^VARS$/,/^RULES$/ {
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		print "    module Term:rules() {"
	} else if ($1 == "EVAL") {
		# end of module Term:rules()
		print "    }"
		# end of %gom
		print "  }"
	} else {
		print "      " $0 | CONVERT
		close (CONVERT)
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		# to avoid the Java constraint that every method should be
		# small enough to be compiled into a 64-kbyte binary segment,
		# the main() method will be split into several functions
		# main1(), main2(), etc. such that each function has only
		# MAX_EXPRESSIONS_PER_FUNCTION instructions.
		MAX_EXPRESSIONS_PER_FUNCTION = 100
		NB_EXPRESSIONS = 0
		CURRENT_FUNCTION_NUMBER = 0
		print "  public static void main (String[] args) {"
		if (TIME_MEASUREMENT != 0) {
			print "    long startChrono;"
			print "    long stopChrono;"
		}
	} else if ($1 == "END-SPEC") {
		# end of current function
		print "  }"
		# end of class
		print "}"
	} else {
		if (TIME_MEASUREMENT != 0) {
			print ""
			print "    startChrono = System.currentTimeMillis ();"
		}
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
		if (TIME_MEASUREMENT != 0) {
			print "    stopChrono = System.currentTimeMillis ();"
			print "    System.out.println (\"reduced in \" + (stopChrono-startChrono) + \" ms\");"
		}
	}
}

