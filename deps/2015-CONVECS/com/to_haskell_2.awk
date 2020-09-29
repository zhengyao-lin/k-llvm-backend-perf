
# Hubert Garavel -- quick-and-dirty REC translator to Haskell

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# first pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		print "\n  deriving (Show, Eq, Ord)\n\n"
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : ... -> ...
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT != "-") 
				print "\n  deriving (Show, Eq, Ord)\n\n" 
			print "data " RESULT_SORT " = " | CONVERT
			close (CONVERT)
			CURRENT_SORT = RESULT_SORT
			FIRST = 1
		}
		if (FIRST == 1) {
			FIRST = 0
		} else {
			print " | "
		}
		print $1 | CONVERT
		close (CONVERT)
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		sub (" $", "", $0)
		if (NF != 0) {
			print " " $0 " " | CONVERT
			close (CONVERT)
		}
	}
} 

/^OPNS$/,/^VARS$/ {
	# second pass to declare non-constructors
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		# here, $0 = <non-constructor> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print $1 " :: "  | CONVERT
		close (CONVERT)
		sub ("-> ", "", $0)
		for (I = 3; I <= NF; ++I) {
			print $I | CONVERT
			close (CONVERT)
			if (I < NF) print " -> "
		}
		print "\n"
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		print ""
		CURRENT_FUNCTION = "-"
	} else if ($1 == "EVAL") {
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		# check for the existence of a premiss (conditional equation)
		F = $1
		if (F == CURRENT_FUNCTION) {
			NULLARY = $0 ~ "^[^(].*->"
			if (NULLARY) {
				# corner case (nullary function defined using
				# several rules) - see related discussion in
				# https://ghc.haskell.org/trac/ghc/ticket/10708
				# we assume that all these rules have premisses
				# otherwise chaos will ensue;
				# remove $1 from $0
				sub ("^[A-Za-z0-9_ \t]*->", " ->", $0)
				# inserting a " " before "->" seems mandatory!
			}
		}
		CURRENT_FUNCTION = F
		PREMISS = index ($0, " if ")
		if (PREMISS == 0) {
			# there is no premiss
			sub ("->", "=", $0)
		} else {
			# there is a premiss
			# $0 has the form: <left> -> <right> if <premiss>
			# $0 is then modified to get the following form:
			# <left> | <premiss> = <right>
			COND = "| " substr ($0, PREMISS + 4) " = "
			sub ("->", COND, $0)
			sub (" if .*", "", $0)
		}
		print $0 | CONVERT
		close (CONVERT)
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "\nmain = do"
	} else if ($1 == "END-SPEC") {
	} else {
		print "  print " $0 | CONVERT
		close (CONVERT)
	}
}

