
# Hubert Garavel -- quick-and-dirty REC translator to LOTOS

# this script imports the DIR, TYPE_FILE and SCRIPT variables

BEGIN {
	CONVERT = "sh " SCRIPT
}

/^REC-SPEC / {
	print "specification " toupper($2) " [PRINT] : noexit"
	print "library BOOLEAN endlib"
	print "type LOTOS_TYPE is BOOLEAN"
}

/^SORTS$/,/^CONS$/ {
	if ($1 == "SORTS") {
		print "sorts"
	} else if ($1 == "CONS") {
	} else {
		# line = <type1> <type2> ... <typeN>
		ORS = ""
		print "  "
		for (I = 1 ; I <= NF ; ++I) {
			print $I
			if (I < NF) print ", "
		} ; 
		print "\n"
		ORS = "\n"
		# keep a copy of the list of sorts in an array
		NB_SORTS = NF
		split ($0, SORT)
	} 
}

/^CONS$/,/^VARS$/ {
	if ($1 == "CONS") {
		print "opns"
		# declare the equality/inequality functions for each sort
		for (I = 1; I <= NB_SORTS; ++I)
			print "  _==_, _/=_ : " SORT [I] ", " SORT [I] " -> BOOL"
		# start in the constructor section
		CONSTRUCTOR = 1
	} else if ($1 == "OPNS") {
		# leave in the constructor section and enter the
		# non-constructor section
		CONSTRUCTOR = 0
	} else if ($1 == "VARS") {
	} else {
		# line = <function> : <type1> <type2> ... <typeN> -> <type>
		ORS = ""
		print "  " $1 " "
		if (CONSTRUCTOR) {
			# $1 is a constructor
			print "(*! constructor *) : "
		} else {
			# $1 is a non-constructor
			print ": "
		}
		# print the types of the arguments and result of function $1
		for (I = 3 ; I <= NF ; ++I) {
			print $I ; 
			if ((NF > 5) && (I < NF - 2)) {
				print ","
			}
			print " "
		}
		print "\n"
		ORS = "\n"
	}
} 

/^VARS$/,/^RULES$/ {
	if ($1 == "VARS") {
		print "eqns"
		print "forall"
	} else if ($1 == "RULES") {
		# declare also the variables that will be used to define the
		# equality/inequality functions for each sort
		for (I = 1; I <= NB_SORTS; ++I) {
			X = "REC_" SORT [I] "_X"
			Y = "REC_" SORT [I] "_Y"
			ORS = ""
			print "  " X ", " Y " : " SORT [I]
			if (I < NB_SORTS)
				print ","
			print "\n"
			ORS = "\n"
		}
	} else {
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
		print ",\n"
		ORS = "\n"
	}
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
		CURRENT_SORT = "-"
		for (I = 1; I <= NB_SORTS; ++I) {
			# define the equality/inequality functions for each sort
			X = "REC_" SORT [I] "_X"
			Y = "REC_" SORT [I] "_Y"
			print "ofsort BOOL"
			print "  " X " == " X " = TRUE;"
			print "  (* otherwise *) " X " == " Y " = FALSE;"
			print "ofsort BOOL"
			print "  " X " /= " X " = FALSE;"
			print "  (* otherwise *) " X " /= " Y " = TRUE;"
		}
	} else if ($1 == "EVAL") {
		print "endtype"
	} else {
		# line = $1 ... (i.e., an equation that defines function $1)
		# compute the result type of $1 and store it in S
		CMD = "sh " DIR "/rec_type -check " $1 " " TYPE_FILE
		CMD | getline S
		close (CMD)
		if (S != CURRENT_SORT) {
			# we avoid printing redundant "ofsort" lines
			print "ofsort " S
			CURRENT_SORT = S
		}
		# check for the existence of a premiss (conditional equation)
		PREMISS = index ($0, " if ")
		ORS = ""
		print "  "
		if (PREMISS != 0) {
			# there is a premiss
			print substr ($0, PREMISS + 4) | CONVERT
			close (CONVERT)
			print " => "
			sub (" if .*", "", $0)
		}
		sub ("->", "=", $0)
		print $0 ";\n" | CONVERT
		close (CONVERT)
		ORS = "\n"
	}
} 

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
		print "behaviour"
	} else if ($1 == "END-SPEC") {
		print "  stop"
		print "endspec"
	} else {
		print "  PRINT !" $0 ";"
	}
}

