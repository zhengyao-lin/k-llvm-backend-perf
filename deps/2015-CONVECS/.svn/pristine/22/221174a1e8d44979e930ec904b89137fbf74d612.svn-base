
# Hubert Garavel -- quick-and-dirty REC translator to Clean

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	print "module " tolower ($2) "\n"
	print "import StdEnv;\n"
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : ... -> ...
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT != "-") {
				print "\n"
			}
			print ":: " RESULT_SORT " =\n" | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
			FIRST = 1
		}
		if (FIRST == 1) {
			FIRST = 0
			print "     "
		} else {
			print "   | "
		}
		print $1 | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		if (NF != 0) {
			# insertion of a strictness pragma "!" before each type
			sub ("^", "!", $0)
			gsub (" ", " !", $0)
			print " " $0 | CONVERT
			close (CONVERT)
		}
		print "\n"
	}
} 

