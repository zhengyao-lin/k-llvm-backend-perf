
# Hubert Garavel -- quick-and-dirty REC translator to mCRL2

# this script imports the DIR, TYPE_FILE, EVAL_FILE and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
}

/^SORTS$/,/^CONS$/ {
}

/^CONS$/,/^OPNS$/ {
	# pass to declare sorts and constructors
	if ($1 == "CONS") {
		CURRENT_SORT = "-"
		ORS = ""
	} else if ($1 == "OPNS") {
		print " ;\n\n"
		ORS = "\n"
	} else {
		# here, $0 = <constructor> : ... -> ...
		RESULT_SORT = $NF
		if (RESULT_SORT != CURRENT_SORT) {
			if (CURRENT_SORT != "-") 
				print " ;\n\n" 
			print "sort " RESULT_SORT " = struct"
			CURRENT_SORT = RESULT_SORT
			FIRST = 1
		}
		if (FIRST == 1) {
			FIRST = 0
			print "\n  "
		} else {
			print "\n| "
		}
		print $1
		sub (".*: ", "(", $0)
		sub ("[ ]*->.*$", ")", $0)
		# nullary constructors are not followed by "()"
		sub ("[ ]*[(][)]$", "", $0)
		# insert commas between arguments
		gsub ("[ ]*[ ]", ", ", $0)
		if (NF != 0)
			print " " $0
	}
} 

/^OPNS$/,/^VARS$/ {
	if ($1 == "OPNS") {
		NEED_TO_PRINT_MAPS = 1
	} else if ($1 == "VARS") {
	} else {
		# line = <function> : <type1> <type2> ... <typeN> -> <type>
		if (NEED_TO_PRINT_MAPS == 1) {
			# "map" must be printed only if there exist maps
			print "map"
			NEED_TO_PRINT_MAPS = 0
		}
		ORS = ""
		# define the constructor function $1
		print "  " $1 " : "
		if (NF == 4) {
			# $1 has no argument (the <typeI>s are absent)
			print $4 " "
		} else {
			# assert NF > 4 : $1 has at least one argument
			# print types of arguments and result of $1
			for (I = 3 ; I <= NF ; ++I) {
				print $I
				if ((NF > 5) && (I < NF - 2)) {
					print " #"
				}
				print " "
			}
		}
		print ";\n"
		ORS = "\n"
	}
} 

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
		NEED_TO_PRINT_VAR = 1
	} else if ($1 == "RULES") {
	} else {
		if (NEED_TO_PRINT_VAR == 1) {
			# "var" must be printed only if there exist vars
			print "var"
			NEED_TO_PRINT_VAR = 0
		}
		# line = <var1> <var2> ... <varN> : <type>
		ORS = ""
		print "  "
		for (I = 1 ; I <= NF ; ++I) {
			print $I
			if ((NF > 3) && (I < NF - 2)) {
				print ", "
			} else {
				print " "
			}
		}
		print ";\n"
		ORS = "\n"
	}
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		NEED_TO_PRINT_EQN = 1
	} else if ($1 == "EVAL") {
	} else {
		if (NEED_TO_PRINT_EQN == 1) {
			# "eqn" must be printed only if there exist eqns
			print "eqn"
			NEED_TO_PRINT_EQN = 0
		}
		# line = $1 ... (i.e., an equation that defines function $1)
		sub ("->", "=", $0)

		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		if (PREMISS != 0) {
			# there is a premiss
			ORS = ""
			print "  " substr ($0, PREMISS + 4) " ->" | CONVERT
			close (CONVERT)
			sub (" if .*", "", $0)
			print " " $0 " ;\n" | CONVERT
			close (CONVERT)
			ORS = "\n"
		} else {
			print "  " $0 " ;" | CONVERT
			close (CONVERT)
		}
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "act"
	} else if ($1 == "END-SPEC") {
		close (EVAL_FILE)
		print "init"
		CMD = "cat " EVAL_FILE
		system (CMD)
		print "  delta ;"
	} else {
		CMD = "sh " DIR "/rec_type -check " $1 " " TYPE_FILE
		CMD | getline S
		close (CMD)
		# declare action print_S if not declared already
		if (ALREADY_DECLARED [S] != 1) {
			print "  print_" S " : " S " ;"
			ALREADY_DECLARED [S] = 1
		}
		print "  print_" S " (" $0 ") ." >> EVAL_FILE
	}
}

