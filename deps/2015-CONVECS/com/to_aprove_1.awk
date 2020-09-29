
# Hubert Garavel -- quick-and-dirty REC translator to AProVE's input format

# this script imports the DIR and METARULES variables

BEGIN {
	HAS_CONDITIONAL_RULES = 0
	HIGHEST_CONSTRUCTOR_ARITY = 0
	# setting the following variable to 1 will generate TRS code for
	# the expressions of the EVAL section
	TRANSLATE_ENTRY_POINTS = 0
}

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		NB_SORTS = split ($0, SORT, " ")
	}
}

function PRINT_PARAMETER_LIST (NAME) {
	# display a list of formal parameters for the current constructor
	if (ARITY > 0) {
		print " (" >> METARULES
		for (N = 1; N <= ARITY; ++N) {
			print NAME N >> METARULES
			if (N < ARITY) {
				print ", " >> METARULES
			}
		}
		print ")" >> METARULES
	}
}

/^CONS$/,/^OPNS$/ {
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
	} else if ($1 == "OPNS") {
		close (METARULES)
	} else {
		# here, $0 = <function> : <type1> <type2> ... <typeN> -> <type>
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			# beginning of a new sort
			CONSTRUCTOR_RANK = 0
			CURRENT_SORT = RESULT_SORT
		} else {
			++ CONSTRUCTOR_RANK
		}
		# $1 is a constructor
		CURRENT_CONSTRUCTOR = $1
		ORS = ""
		sub (".*: ", "", $0)
		sub ("->.*$", "", $0)
		# here, $0 = <type1> <type2> ... <typeN>
		ARITY = NF
		if (ARITY > HIGHEST_CONSTRUCTOR_ARITY) {
			HIGHEST_CONSTRUCTOR_ARITY = ARITY
		}
		# print a REC_Rank rule for the current constructor
		print " REC_Rank" CURRENT_SORT " (" CURRENT_CONSTRUCTOR >> METARULES
		PRINT_PARAMETER_LIST ("REC_X")
		print ") -> " >> METARULES
		# print Nat value CONSTRUCTOR_RANK expressed as a term
		# built using REC_Zero and REC_Succ
		for (N = 1; N <= CONSTRUCTOR_RANK; ++N) {
			print "REC_Succ (" >> METARULES
		}
		print "REC_Zero" >> METARULES
		for (N = 1; N <= CONSTRUCTOR_RANK; ++N) {
			print ")" >> METARULES
		}
		print "\n" >> METARULES
		# print a REC_Eq... rule for the current constructor
		print " REC_Eq" CURRENT_SORT " (" CURRENT_CONSTRUCTOR >> METARULES
		PRINT_PARAMETER_LIST ("REC_X")
		print ", " CURRENT_CONSTRUCTOR >> METARULES
		PRINT_PARAMETER_LIST ("REC_Y")
		print ") -> " >> METARULES
		if (ARITY == 0) {
			print "REC_True" >> METARULES
		} else {
			for (N = 1; N <= ARITY; ++N) {
				if (N < ARITY) {
					print "REC_And (" >> METARULES
				}
				# here, $N is the sort of the N-th argument
				# of CURRENT_CONSTRUCTOR
				print "REC_Eq" $N " (REC_X" N ", REC_Y" N ")" >> METARULES
				if (N < ARITY) {
					print ", " >> METARULES
				}
			}
			for (N = 1; N <= ARITY; ++N) {
				if (N < ARITY) {
					print ")" >> METARULES
				}
			}		
		}
		print "\n" >> METARULES
		ORS = "\n"
	}
} 

/^OPNS$/,/^VARS$/ {
} 

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
		ORS = ""
		KEYWORD_VAR_WAS_PRINTED = 0
	} else if ($1 == "RULES") {
		ORS = "\n"
		if (KEYWORD_VAR_WAS_PRINTED == 1) {
			# "VAR" has been printed
			print ")"
		}
	} else {
		if (KEYWORD_VAR_WAS_PRINTED == 0) {
			# "VAR" must be printed only if there exist vars
			print "(VAR"
			KEYWORD_VAR_WAS_PRINTED = 1
		}
		# line = <var1> <var2> ... <varN> : <type>
		sub ("[ ]*:.*", "", $0)
		# line = <var1> <var2> ... <varN>
		print " " $0
	}
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		KEYWORD_RULES_WAS_PRINTED = 0
	} else if ($1 == "EVAL") {
		NB_EVAL_EXPRESSIONS = 0
	} else {
		if (KEYWORD_RULES_WAS_PRINTED == 0) {
			# "RULES" must be printed only if there exist rules
			print "(RULES"
			KEYWORD_RULES_WAS_PRINTED = 1
		}
                PREMISS = index ($0, " if ")
                if (PREMISS == 0) {
                        # there is no premiss
			print " " $0
                } else {
			HAS_CONDITIONAL_RULES = 1
			# translation similar to that for STRATEGO
			ORS = ""
			print " " substr ($0, 1, PREMISS) "| "
			REMAINDER = substr ($0, PREMISS + 4)
			NB_CONDITIONS = split (REMAINDER, CONDITIONS, " and-if ")
			for (N = 1; N <= NB_CONDITIONS; ++N) {
				if (N < NB_CONDITIONS) {
					print "REC_And ("
				}
				# extracting the first identifier (either a
				# variable, a constructor or a function) of
				# CONDITIONS [N]
				IDENTIFIER = CONDITIONS [N]
				gsub ("\(", "", IDENTIFIER)
				gsub ("\)", "", IDENTIFIER)
				sub ("[^A-Za-z0-9].*$", "", IDENTIFIER)
				# computing the type S of IDENTIFIER
				CMD = "sh " DIR "/rec_type -check " IDENTIFIER " " TYPE_FILE
				CMD | getline S
				close (CMD)
				if (index (CONDITIONS [N], "-><-") != 0) {
					# CONDITIONS [N] contains -><-
					print "REC_Eq" S " (" 
					sub ("[ ]*-><-[ ]*", ", ", CONDITIONS [N])
					print CONDITIONS [N]
					print ")"
				} else {
					# CONDITIONS [N] contains ->/<-
					print "REC_Not (REC_Eq" S " ("
					sub ("[ ]*->/<-[ ]*", ", ", CONDITIONS [N])
					print CONDITIONS [N]
					print "))"
				}
				if (N < NB_CONDITIONS) {
					print ", "
				}
			}
			for (N = 1; N <= NB_CONDITIONS; ++N) {
				if (N < NB_CONDITIONS) {
					print ")"
				}
			}
			print " -> REC_True\n"
			ORS = "\n"
		}
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if (TRANSLATE_ENTRY_POINTS == 0) {
		# do not translate this line; ignore it
		next
	}
	++ NB_EVAL_EXPRESSIONS
	if (KEYWORD_RULES_WAS_PRINTED == 0) {
		# "RULES" must be not printed if it has already been printed
		print "(RULES"
		KEYWORD_RULES_WAS_PRINTED = 1
	}
	print " main" NB_EVAL_EXPRESSIONS " -> " $0
}

END {
	if (KEYWORD_RULES_WAS_PRINTED == 1) {
		# "RULES" has been printed; let's close if
		print ")"
	} else {
		# there are no rules at all; we need to print an empty RULES
		# section, because AProVE rejects empty files as syntactically
		# incorrect
		print "(RULES)" 
	}
	if (HAS_CONDITIONAL_RULES == 0) {
		# there are no conditional rules; in such case we could add
		# the tag "(STRATEGY INNERMOST)", as the innermost strategy
		# can only be requested when there are no conditional rules,
		# but we don't do this, as certain tools (e.g., mCRL2) do not
		# use the innermost strategy
	} else {
		# define free variables
		ORS = ""
		print "(VAR REC_M REC_N REC_X REC_Y "
		for (N = 1; N <= HIGHEST_CONSTRUCTOR_ARITY; ++N) {
			print "REC_X" N " " "REC_Y" N
			if (N < HIGHEST_CONSTRUCTOR_ARITY)
				print " "
		}
		print ")\n"
		ORS = "\n"
		print "(RULES"
		# define the REC_Not operator: Bool -> Bool
		print " REC_Not (REC_False) -> REC_True"
		print " REC_Not (REC_True) -> REC_False"
		# define the REC_And operator: Bool, Bool -> Bool
		print " REC_And (REC_False, REC_False) -> REC_False"
		print " REC_And (REC_False, REC_True) -> REC_False"
		print " REC_And (REC_True, REC_False) -> REC_False"
		print " REC_And (REC_True, REC_True) -> REC_True"
		# define the REC_Ne operator: Nat, Nat -> Bool
		print " REC_Ne (REC_Zero, REC_Zero) -> REC_False"
		print " REC_Ne (REC_Zero, REC_Succ (REC_M)) -> REC_True"
		print " REC_Ne (REC_Succ (REC_M), REC_Zero) -> REC_True"
		print " REC_Ne (REC_Succ (REC_M), REC_Succ (REC_N)) -> REC_Ne (REC_M, REC_N)"
		# define the REC_Rank operators: S -> Nat
		while (1) {
			RESULT = getline < METARULES
			if (RESULT == -1) {
				# read failure
				print "*** problem reading METARULES"
				exit 1
			} else if (RESULT == 0) {
				# end of file
				close (METARULES)
				break
			} else {
				# insert the line read from METARULES
				print $0
			}
		}
		# define the REC_Eq operators: S, S -> Bool
		for (I = 1; I <= NB_SORTS ; ++I) {
			S = SORT [I]
			print " REC_Eq" S " (REC_X, REC_Y) -> REC_False | REC_Ne (REC_Rank" S " (REC_X), REC_Rank" S " (REC_Y)) -> REC_True"
		}
		print ")"
	}
}

