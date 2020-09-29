
# Hubert Garavel -- quick-and-dirty REC translator to STRATEGO

# this script imports the DIR variable

# this awk script generates a shell script that:
# - replaces each constant constructor C by C()
# - replaces each constant function F by F()

BEGIN {
	print "#! /bin/sh"
} 

/^REC-SPEC / {
}

/^SORTS$/,/^VARS$/ {
}

/^CONS$/,/^VARS$/ {
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else if ($1 == "VAR") {
	} else {
		# here, $0 = <constructor> : ... -> ...
		# or <function> : ... -> ...
		if (NF == 4) {
			# here, $0 = <constructor> : -> <type>
			# or <function> : -> <type>
			# $1 is a nullary constructor or function
			print "sed -e 's/\\<" $1 "\\>/" $1 "()/g' |"
		}
	}
}

END {
	print "cat"
}
