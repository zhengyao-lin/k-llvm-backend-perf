
# Hubert Garavel -- quick-and-dirty REC translator to Maude

# this awk script generates a shell script that:
# - replaces -> with =
# - replaces -><- with ==
# - replaces ->/<- with =/=
# - replace each free variable X of type T with X:T (this is needed in 
#   Maude equations)

BEGIN {
	print "#! /bin/sh"
	print "sed -e 's+->\\([^</]\\)+=\\1+' |"
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
			print "sed -e 's/\\<"$I"\\>/"$I":"$NF"/g' |"
	}
} 

END {
	print "cat"
}

