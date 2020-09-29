
# Hubert Garavel -- quick-and-dirty REC translator to STRATEGO

# this script imports the DIR and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	print "module " tolower ($2) "\n"
	print "imports libstrategolib\n"
	print "signature\n"
}

/^SORTS$/,/^CONS$/ {
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		# here, $0 = <sort1> <sort2> ... <sortn>
		print "sorts"
		print "   " $0 "\n"
	}
}

/^CONS$/,/^VARS$/ {
	# pass to declare constructors and non-constructors in the same way
	if ($1 == "CONS") {
		print "constructors"
	} else if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		# $0 = <constructor> : <type1> <type2> ... <typeN> -> <type>
		# or $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		# define the constructor function $1
		print "   " $1 " : "
		if (NF == 4) {
			# $1 has no argument (the <typeI>s are absent)
			print $4 " "
		} else {
			# assert NF > 4 : $1 has at least one argument
			# print types of arguments and result of $1
			for (I = 3 ; I <= NF ; ++I) {
				print $I
				if ((NF > 5) && (I < NF - 2)) {
					print " *"
				}
				print " "
			}
		}
		print "\n"
		ORS = "\n"
	}
} 

/^VARS$/,/^RULES$/ {
	# STRATEGO does not require local variables to be declared
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		print "\nrules"
		NB_RULES = 0
		NB_CONDITIONAL_RULES = 0
	} else if ($1 == "EVAL") {
		print "\nstrategies"
		if (NB_RULES == 0) {
			print "   eval = id"
		} else {
			print "   eval = memo (innermost (REC_E))"
		}
		if (NB_CONDITIONAL_RULES > 0) {
			print "   equal-after-eval (|m1, m2) = equal (|<eval> m1, <eval> m2)"
		}
		print "   eval-and-print = eval ; debug (!\"result = \")"
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		ORS = ""
		++ NB_RULES
		# all our rules are named "REC_E"
		print "   REC_E : " 
		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		if (PREMISS == 0) {
			# there is no premiss
			print $0 "\n" | CONVERT
			close (CONVERT)
		} else {
			# there is a premiss
			++ NB_CONDITIONAL_RULES
			print substr ($0, 1, PREMISS) | CONVERT
			close (CONVERT)
			print "where "
			REMAINDER = substr ($0, PREMISS + 4)
			NB_CONDITIONS = split (REMAINDER, CONDITIONS, " and-if ")
			for (N = 1; N <= NB_CONDITIONS; ++N) {
				if (index (CONDITIONS [N], "-><-") != 0) {
					# CONDITIONS [N] contains -><-
					print "equal-after-eval (|" 
					sub ("[ ]*-><-[ ]*", ", ", CONDITIONS [N])
					print CONDITIONS [N] | CONVERT
					close (CONVERT)
					print ")"
				} else {
					# CONDITIONS [N] contains ->/<-
					print "not (equal-after-eval (|"
					sub ("[ ]*->/<-[ ]*", ", ", CONDITIONS [N])
					print CONDITIONS [N] | CONVERT
					close (CONVERT)
					print "))"
				}
				if (N < NB_CONDITIONS) {
					print " ; "
				}
			}
			print "\n"
		}
		ORS = "\n"
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "   main = "
	} else if ($1 == "END-SPEC") {
		print "      <exit> 0"
	} else {
		sub ("get normal form for: ", "", $0)
		ORS = ""
		print "      (<eval-and-print> "
		print $0 | CONVERT
		close (CONVERT)
		print ") ;\n"
		ORS = "\n"
	}
}

