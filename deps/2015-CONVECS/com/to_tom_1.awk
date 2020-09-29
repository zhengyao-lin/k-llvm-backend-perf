
# Hubert Garavel -- quick-and-dirty REC translator to Tom

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

/^CONS$/,/^VARS$/ {
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		if (NF == 4) {
			# line = <function> : -> <type>
			print "sed -e 's/\\<"$1"\\>/"$1"()/g' |"
		}
	}
} 

END {
	print "cat"
}
