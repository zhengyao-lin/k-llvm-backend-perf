
# Hubert Garavel -- quick-and-dirty REC translator to Clean

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# another pass to declare an equality function for each sort
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		if (CURRENT_SORT != "-") {
			# add the final rule for CURRENT_SORT equality
			print "   (==) rec_x rec_y = False\n"
		}
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT != "-") {
				# add the final rule for CURRENT_SORT equality
				print "   (==) rec_x rec_y = False\n"
			}
			print "\ninstance == "
			print RESULT_SORT | CONVERT
			close (CONVERT)
			print " where\n"
			CURRENT_SORT = RESULT_SORT
		}
		CONSTRUCTOR = $1
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		# print the constructor arguments (if any)
		print "   (==) ("
		print CONSTRUCTOR | CONVERT
		close (CONVERT)
		for (I = 1; I <= NF; ++ I) {
			print " rec_x" I
		}
		print ") ("
		print CONSTRUCTOR | CONVERT
		close (CONVERT)
		for (I = 1; I <= NF; ++ I) {
			print " rec_y" I
		}
		print ") = "
		if (NF == 0) {
			print "True"
		} else {
			for (I = 1; I <= NF; ++ I) {
				print "(rec_x" I " == rec_y" I ")"
				if (I < NF) print " && "
			}
		}
		print "\n"
	}
}

