
# Imad Larrada et Hubert Garavel -- quick-and-dirty REC translator to Rascal

# this awk script generates a shell script that:
# - replaces -><- with ==
# - replaces ->/<- with |=
# - replace each constant function F by F()

BEGIN {
	print "#! /bin/sh"
	print "sed -e 's+-><-+=+g' |"
	print "sed -e 's+->/<-+|=+g' |"
	print "sed -e 's+\\<and-if\\>+and+g' |"
} 

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
	# properly capitalize types (according to Opalica conventions)
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		# here, $0 = <type1> <type2> ... <typeN>
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
		# here, $0 = <var1> <var2> ... <varN> ":" <type>
		SORT = $NF
		sub (":.*$", "", $0)
		# here, $0 = <var1> <var2> ... <varN>
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
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
	# the OPAL compiler seems to have trouble with very long lines :
	# to avoid such issues, we insert a \n after every 20 commas
	print "sed -e 's/\\([^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*\\),/\\1,\\n/g'"
	# print "cat"
}
