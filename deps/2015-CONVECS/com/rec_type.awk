
# Hubert Garavel -- quick-and-dirty REC translators

# this script imports the environment variable VARIABLES 

# this awk script builds a file that contains lines of the form "F:T"
# for each constructor and non-constructor function F of type T
# (if VARIABLES = "yes", a line "X:T" is added for each variable X)

/^CONS$/,/^VARS$/ {
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		# line = <function> : <type1> <type2> ... <typeN> -> <type>
		print $1 ":" $NF
	} 
}

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# line = <var1> <var2> ... <varN> : <type>
		if (VARIABLES = "yes") {
			for (I = 1 ; I <= NF - 2 ; ++I) {
				print $I ":" $NF
			}
		}
	} 
}
