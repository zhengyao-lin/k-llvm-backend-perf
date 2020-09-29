
# Hubert Garavel -- quick-and-dirty REC translator to Haskell

# this script imports the DIR variable

BEGIN {
	print "#! /bin/sh"
	print "sed -e 's+->\\([^</]\\)+=\\1+' |"
	print "sed -e 's+-><-+==+g' |" 
	print "sed -e 's+->/<-+/=+g' |" 
	print "sed -e 's+\\<and-if\\>+\\&\\&+g' |" 
} 

/^SORTS$/,/^CONS$/ {
	# properly capitalize types
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		# line = <type1> <type2> ... <typeN>
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
			print "sed -e 's/\\<" $I "\\>/"
			CAPITALIZE = "sh " DIR "/rec_upper "
			print $I | CAPITALIZE
			close (CAPITALIZE)
			print "/g' |\n"
			ORS = "\n"
		}
	}
}

/^CONS$/,/^VARS$/ {
	# properly capitalize constructors and non-constructors
	if ($1 == "CONS") {
		# constructors in upper case
		COMMAND = "/rec_upper "
	} else if ($1 == "OPNS") {
		# non-constructors in lower case
		COMMAND = "/rec_lower "
	} else {
		# here, $0 = <function> : ... -> ...
		ORS = ""
		print "sed -e 's/\\<" $1 "\\>/"
		CAPITALIZE = "sh " DIR COMMAND
		print $1 | CAPITALIZE
		close (CAPITALIZE)
		print "/g' |\n"
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
	# properly capitalize free variables
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# line = <var1> <var2> ... <varN> ":" <type>
		sub (":.*$", "", $0)
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
			print "sed -e 's/\\<" $I "\\>/"
			CAPITALIZE = "sh " DIR "/rec_lower "
			print $I | CAPITALIZE
			close (CAPITALIZE)
			print "/g' |\n"
			ORS = "\n"
		}
	}
}

END {
	# here we start a crude translation from usual algebraic
	# expressions "f (x1, ..., xn)" to Haskell expressions
	# "f x1 ... xn".
	# step 1: remove all commas
	print "sed -e 's/,/ /g' |"
	print "sed -e 's/[ ][ ]*/ /g' |"
	# step 2: replace all "f (..." by "(f ..."
	print "sed -e 's/\\([A-Za-z0-9_][A-Za-z0-9_]*\\) (/(\\1 /g' |"
	# step 3: remove "(" at beginning of line, if present
	print "sed -e 's/^(//' |"
	# step 4: remove ")" before "= " (for non-conditional equations)
	print "sed -e 's/^\\([^|]*\\))[ ]*= /\\1 = /' |"
	# step 5: remove ")" before " | " (for conditional equations)
	print "sed -e 's/)[ ]* | / | /' |"
	print "cat"
}

