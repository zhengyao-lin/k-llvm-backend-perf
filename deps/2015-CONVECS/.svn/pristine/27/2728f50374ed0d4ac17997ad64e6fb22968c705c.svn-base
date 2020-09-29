
# Hubert Garavel and Imad Larrada -- quick-and-dirty REC translator to Ocaml and SML

# this script imports the DIR, SCRIPT, and DIALECT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		if (DIALECT == "SML-NOWHERE") {
			print "local\n"
		}
		ORS = ""
	} else if ($1 == "OPNS") {
		ORS = "\n"
		if (DIALECT == "OCAML") {
			print " ;;"
		} else if (DIALECT == "SML-NOWHERE") {
			print " ;\n"
			print "in\n"
		} else if (DIALECT == "SML") {
			print " ;"
		}
	} else {
		# here, $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT == "-") {
				# this is the first type declaration
				if (DIALECT == "OCAML") {
					print "type "
				} else if ((DIALECT == "SML-NOWHERE") || (DIALECT == "SML")) {
					print "datatype "
		}
			} else {
				print "\n\nand " 
			}
			print RESULT_SORT " = " | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
			FIRST = 1
		}
		if (FIRST == 1) {
			FIRST = 0
		} else {
			print " | "
		}
		print $1 | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		if (NF != 0) {
			# insert "*" character between the <typeI>s
			gsub (" ", " * ", $0)
			print " of " $0 | CONVERT
			close (CONVERT)
		}
	}
} 

