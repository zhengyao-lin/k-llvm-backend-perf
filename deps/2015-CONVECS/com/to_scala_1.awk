
# Hubert Garavel -- quick-and-dirty REC translator to Scala

# this script imports the DIR variable

# this awk script generates a shell script that:
# - replaces -><- with ==
# - replaces ->/<- with !=
# - replace each constant function F by F()
# - properly capitalize identifiers

BEGIN {
	print "#! /bin/sh"
	print "sed -e 's+-><-+==+g' |"
	print "sed -e 's+->/<-+!=+g' |"
	print "sed -e 's+\\<and-if\\>+\\&\\&+g' |"
} 

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
	# properly capitalize types
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		# here, $0 = <type1> <type2> ... <typeN>
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
	if ($1 == "CONS") {
		# constructors in upper case
		COMMAND = "/rec_upper "
	} else if ($1 == "OPNS") {
		# non-constructors in lower case
		COMMAND = "/rec_lower "
	} else if ($1 == "VARS") {
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		# add "()" after nullary functions
		if (NF == 4) {
			# here, $0 = <function> : -> <type>
			# $1 is a nullary function
			PARENTHESES = "()"
		} else {
			# $1 is not a nullary function
			PARENTHESES = ""
		}
		# properly capitalize constructors and non-constructors 
		ORS = ""
		print "sed -e 's/\\<" $1 "\\>/"
		CAPITALIZE = "sh " DIR COMMAND
		print $1 | CAPITALIZE
		close (CAPITALIZE)
		print PARENTHESES
		print "/g' |\n"
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
	# properly capitalize free variables
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# here, $0 = <var1> <var2> ... <varN> ":" <type>
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

/^END-SPEC$/ {
	print "cat"
}
