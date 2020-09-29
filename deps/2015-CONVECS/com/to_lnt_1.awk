
# Hubert Garavel -- quick-and-dirty REC translator to LNT

BEGIN {
}

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# line = <var1> <var2> ... <varN> : <type>
		COMMON_TYPE = $NF
		for (I = 1 ; I <= NF - 2; ++I) {
			VAR_TYPE [$I] = COMMON_TYPE
		}
	}
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
	} else if ($1 == "EVAL") {
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		CURRENT_FUNCTION = $1
		# remove $1 from the equation
		sub (CURRENT_FUNCTION, "", $0)
		# remove the right-hand side of the equation
		if ($0 ~ " if ") {
			# the equation has a premiss: remove everything from
			# "->" (included) to "if" (included)
			sub ("->.* if ", "", $0)
		} else {
			# the equation has no premiss: remove everything from
			# "->" (included) to end-of-line
			sub ("->.*", "", $0)
		}
		# remove all parentheses and commas
		gsub ("[(),]", " ", $0)
		# remove also the special symbols -><- and ->/<-
		sub ("-><-", " ", $0)
		sub ("->/<-", " ", $0)
		# normalize spaces
		gsub (" [ ]*", " ", $0)

		# search for local variables in $0
		for (I = 1; I <= NF; ++I) {
			if (VAR_TYPE [$I] != "") {
				# field $I was declared as a local variable
				print CURRENT_FUNCTION " " $I ":" VAR_TYPE [$I]
			}
		}
	}
}

