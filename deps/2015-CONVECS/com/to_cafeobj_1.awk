
# Hubert Garavel -- quick-and-dirty REC translator to CafeObj

# this awk script imports the variable FORMAT that is equal to "A" or "B"

# this awk script generates a shell script that:
# - replaces -> with = (if FORMAT = "A") or with => (if FORMAT = "B")
# - replaces -><- with ==
# - replaces ->/<- with =/=
# - replace each free variable X of type T with X:T (this is needed in 
#   CafeObj equations)

BEGIN {
	print "#! /bin/sh"
	if (FORMAT == "A") {
		print "sed -e 's+->\\([^</]\\)+=\\1+' |"
	} else if (FORMAT == "B") {
		print "sed -e 's+->\\([^</]\\)+=>\\1+' |"
	}	
	print "sed -e 's+-><-+==+g' |" 
	print "sed -e 's+->/<-+=/=+g' |" 
	print "sed -e 's+\\<and-if\\>+and+g' |" 
} 

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# line = <var1> <var2> ... <varN> ":" <type>
		for (I = 1 ; I < NF - 1 ; ++ I)
			print "sed -e 's/\\<"$I"\\>/"$I":"$NF"/' |"
	}
} 

END {
	print "cat"
}

