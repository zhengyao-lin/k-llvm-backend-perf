# Hubert Garavel and Imad Larrada and Mohammed-Ali Tabikh -- quick-and-dirty REC translator to OCaml and SML

# this script imports the DIR, COMMA_REMOVER, and DIALECT variables

BEGIN {
	print "#! /bin/sh"
	print "sed -e 's+[ ]*-><-[ ]*+ = +g' |"
	print "sed -e 's+[ ]*->/<-[ ]*+ <> +g' |"
	if (DIALECT == "OCAML") {
		print "sed -e 's+[ ]*\\<and-if\\>[ ]*+ \\&\\& +g' |"
	} else if (DIALECT == "SML") {
		print "sed -e 's+[ ]*\\<and-if\\>[ ]*+ andalso +g' |"
	}
} 

/^SORTS$/,/^CONS$/ {
	# properly capitalize types
	if ($1 == "SORTS") {
	} else if ($1 == "CONS") {
	} else {
		# line = <type1> <type2> ... <typeN>
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
			print "sed -e 's/\\<" $I "\\>/"
			CAPITALIZE = "sh " DIR "/rec_lower "
			print $I | CAPITALIZE
			close (CAPITALIZE)
			print "/g' |\n"
			ORS = "\n"
		}
	}
}

/^CONS$/,/^VARS$/ {
	# properly capitalize constructors and non-constructors
	if ($1 == "CONS") {
		# constructors in upper case
		COMMAND = "/rec_upper "
		CONSTRUCTOR = 1
	} else if ($1 == "OPNS") {
		# non-constructors in lower case
		COMMAND = "/rec_lower "
		CONSTRUCTOR = 0
	} else if ($1 == "VARS") {
	} else {
		# line = <function> : <type1> <type2> ... <typeN> -> <type>
		if (CONSTRUCTOR) {
			PARENTHESES = ""
			if (NF - 4 == 1) {
				# <function> is a constructor with arity 1
				# it will be temporarily prefixed with "_"
				MARK = "_"
				# do not replace "_" with another character!
			} else if (NF - 4 > 1) {
				# <function> is a constructor with arity > 1
				# it will be temporarily prefixed with "@"
				MARK = "@"
			} else {
				# <function> is a constructor with arity 0
				# it will be left unchanged
				MARK = ""				
			}
		} else {
			# <function> is a non-constructor
			# in OCAML, it will be left unchanged
			PARENTHESES = ""
			MARK = ""
			if (DIALECT == "SML") {
				# in SML, calls to non-constructors with
				# arity 0 must be followed with "()";
				# calls to non-constructors with arity > 0
				# will be left unchanged 
				if (NF == 4) {
					# here, $0 = <function> : -> <type>
					# $1 is a nullary function
					PARENTHESES = "()"
				}
			}
		}
		ORS = ""
		print "sed -e 's/\\<" $1 "\\>/" MARK
		CAPITALIZE = "sh " DIR COMMAND
		print $1 | CAPITALIZE
		close (CAPITALIZE)
		print PARENTHESES
		print "/g' |\n"
		ORS = "\n"
	}
}

/^VARS$/,/^RULES$/ {
	# properly capitalize free variables
	if ($1 == "VARS") {
	} else if ($1 == "RULES") {
	} else {
		# line = <var1> <var2> ... <varN> ":" <type>
		sub (":.*$", "", $0)
		for (I = 1 ; I <= NF ; ++I) {
			ORS = ""
			print "sed -e 's/\\<" $I "\\>/"
			CAPITALIZE = "sh " DIR "/rec_lower "
			print $I | CAPITALIZE
			close (CAPITALIZE)
			print "/g' |\n"
			ORS = "\n"
		}
	}
} 

END {
	print "if [ \"$1\" = \"-exp\" ]"
	print "then"
	# the "-exp" option is only used for OCAML, not for SML

	# here we start a crude translation from usual algebraic expressions
	# to OCAML expressions and patterns; this is made horrible by the
	# irregular syntax of ML that violates the principle of uniform
	# references, in particular because constructors and non-constructors
	# have totally different syntactic conventions when they have more
	# than one arguments : constructors with multiple arguments have to 
	# be called C (x1, ..., xn) whereas non-constructors have to be called
	# (f x1 ... xn)

	# Summary of translation rules from REC expression to OCAML expressions
	# notations :
	# 	C : denotes a constructor
	# 	f : denotes a non-constructor
	# -----------------------------------------------------------
	# 		REC			OCAML
	# -----------------------------------------------------------
	# arity 0:	C     			C
	#		f			f -- noted f() in SML
	# arity 1:	C (e)			(C e)
	#		f (e)			(f e)
	# arity > 1:	C (e1, e2)		(C (e1, e2))
	# 		f (e1, e2)		(f e1 e2)
	# -----------------------------------------------------------

	# step 1: selective elimination of commas everywhere but in calls
	# of constructors with arity > 1 (i.e., prefixed with "@"). The
	# "@" characters will be eliminated.
	print "   " COMMA_REMOVER " |"

	# step 2: replace all "f (..." by "(f ..." so as to translate each 
	# "f (x1, ..., xn)" to OCAML "(f x1 ... xn)" but only if f is either
	# a non-constructor (i.e., starts with a lower-case letter) or a
	# constructor with arity 1 (i.e., starts with _)
	print "   sed -e 's/\\<\\([_a-z][A-Za-z0-9_]*\\) (/(\\1 /g' |"

	# step 3: remove all "_" added before constructors with arity 1
	print "   sed -e 's/\\<_\\([A-Z][A-Za-z0-9_]*\\)\\>/\\1/g'"

	print "else"

	# remove all "@" added before constructors with arity > 1
	print "   sed -e 's/@//g' |"
	# remove all "_" added before constructors with arity 1
	print "   sed -e 's/\\<_\\([A-Z][A-Za-z0-9_]*\\)\\>/\\1/g'"

	print "fi"
}

