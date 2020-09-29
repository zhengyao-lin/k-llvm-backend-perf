
# Hubert Garavel and Imad Larrada -- quick-and-dirty REC translator to OPAL

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	# here, $0 = REC-SPEC <name>
	print "IMPLEMENTATION " tolower ($2)
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
	} else if ($1 == "OPNS") {
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			print "\nDATA " RESULT_SORT " == " | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
		}
		# $1 is a constructor
		ORS = ""
		print "     " $1 | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		if (NF == 0) {
			# the constructor is nullary: the "()" have been added
			# already by CONVERT
		} else {
			# declare each constructor argument and its type
			print " ("
			for (I = 1 ; I <= NF ; ++ I) {
				print "rec_x" I" : "$I | CONVERT
				close (CONVERT)
				if (I < NF) print ", "
			}
			print ")"
		}
		print "\n"
		ORS = "\n"
	}
} 

