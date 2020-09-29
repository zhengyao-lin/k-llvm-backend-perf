
# Imad Larrada et Hubert Garavel -- quick-and-dirty REC translator to Rascal

# this script imports the DIR variable

# this awk script generates a shell script that:
# - replaces -><- with ==
# - replaces ->/<- with !=
# - replace each constant function F by F()

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
	# properly capitalize constructors and non-constructors
	if ($1 == "CONS") {
		# constructors in upper case
		COMMAND = "/rec_upper "
	} else if ($1 == "OPNS") {
		# non-constructors in lower case
		COMMAND = "/rec_lower "
	} else if ($1 == "VARS") {
	} else {
		# here, $0 = <function> : ... -> ...
		ORS = ""
		if (NF == 4) {
			# here, $0 = <function> : -> <type>
			# $1 is a nullary function
			PARENTHESES = "()"
		} else {
			# $1 is not a nullary function
			PARENTHESES = ""
		}
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
		SORT = $NF
		# capitalize SORT
		CMD = "echo " SORT " | sh " DIR "/rec_upper "
		CMD | getline SORT
		close (CMD)
		# modify $0
		sub (":.*$", "", $0)
		# here, $0 = <var1> <var2> ... <varN>
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
			# if option "-pat" is present, then replace the first
			# occurrence of variable $I by "SORT $I", so as to
			# declare a free variable $I of type SORT in a pattern
			print "if [ \"$1\" = \"-pat\" ]\n"
			print "then\n"
			print "   sed -e 's/\\<" $I "\\>/" SORT " " $I "/'\n"
			print "else\n"
			print "   cat\n"
			print "fi |\n"
			# in all cases, change all occurrences of variable $I 
			# to lower case
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
	print "cat"
}
