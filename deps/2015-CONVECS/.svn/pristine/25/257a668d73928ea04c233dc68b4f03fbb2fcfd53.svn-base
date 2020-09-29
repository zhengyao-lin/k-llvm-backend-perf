
# Hubert Garavel -- quick-and-dirty REC translator

# this script imports the SCRIPT variable

/^REC-SPEC / {
	# line = "REC-SPEC" <name>
	print "fmod " $2 " is"
}

/^SORTS$/,/^CONS$/ {
	if ($1 == "SORTS") {
		ORS = ""
		print "  sorts "
		ORS = "\n"
	} else if ($1 == "CONS") {
	} else {
		print $0 " ."
	}
}

/^CONS$/,/^OPNS$/ {
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else {
		print "  op " $0 " [ctor] ."
	}
} 

/^OPNS$/,/^VARS$/ {
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		print "  op " $0 " ."
	}
} 

/^VARS$/,/^RULES$/ {
	# nothing (but free variables have been already taken into account
	# when building the SCRIPT file)
} 

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
	} else if ($1 == "EVAL") {
		print "endfm"
	} else {
		CMD = "sh " SCRIPT
		PREMISS = index ($0, " if ")
		if (PREMISS == 0) {
			# normal equation
			print "  eq " $0 " ." | CMD
			close (CMD)
		} else {
			# conditional equation
			print "  ceq " $0 " = true ." | CMD
			close (CMD)
		}
	}
}

/^EVAL$/,/^END-SPEC$/ {
	if ($1 == "EVAL") {
	} else if ($1 == "END-SPEC") {
		print "quit"
	} else {
		print "reduce " $0 " ."
	}
}

