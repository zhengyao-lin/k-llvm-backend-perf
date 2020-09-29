# Hubert Garavel -- merge lines of csv files produced by run

# imports the TIMEOUT variable

BEGIN {
	FS = ","
}

{
	MODEL = $1
	PHASE = $2
	LANG = $3

	if (PHASE == "comp-exec") {
		DISPLAY = 1
		TIMCOMP = ""
		MEMCOMP = ""
		RSSCOMP = ""
		TIMEXEC = ""
		MEMEXEC = ""
		RSSEXEC = ""
		if ($4 == "skept") {
			if ($5 ~ ".* timeout already") {
				STATUS = "TIME-ALREADY"
			} else if ($5 ~ ".* failure already") {
				STATUS = "FAIL-ALREADY"
			}
		} else {
			# here, $4 is "timeout", "kill-*", or an exit status
			if ($4 == "timeout") {
				STATUS = "TIME"
			} else if ($4 ~ "kill-.*") {
				STATUS = "KILL"
			} else if ($4 != 0) {
				STATUS = "FAIL"
			} else {
				# assert $4 == 0
				STATUS = "OK"
			}
			TIMTOTAL = $5
			MEMTOTAL = $6
			RSSTOTAL = $7
		}
	} else if (PHASE == "comp") {
		if ($4 == "skept") {
			print "FATAL ERROR #1 (STATUS = " STATUS ")"
			exit
		} else {
			# here, $4 is "timeout", "kill-*", or an exit status
			if ($4 == "timeout") {
				DISPLAY = 1
				STATUS = "TIME-COMP"
				 # there should be no related "exec" line below
			} else if ($4 ~ "kill-.*") {
				DISPLAY = 1
				STATUS = "KILL-COMP"
				# there should be no related "exec" line below,
				# except in the particular case of Clean with
				# its "kill-13" crashes
			} else if ($4 != 0) {
				DISPLAY = 1
				STATUS = "FAIL-COMP"
				# there should be no related "exec" line below
			} else {
				# assert $4 == 0
				DISPLAY = 0
				STATUS = "OK-COMP" # will be reassigned
			}
			TIMCOMP = $5
			MEMCOMP = $6
			RSSCOMP = $7
			if (DISPLAY == 1) {
				# the following will not be reassigned later
				TIMEXEC = ""
				MEMEXEC = ""
				RSSEXEC = ""
				TIMTOTAL = $5
				MEMTOTAL = $6
				RSSTOTAL = $7
			}
		}
	} else if (PHASE == "exec") {
		DISPLAY = 1
		if ($4 == "skept") {
			print "FATAL ERROR #2 (STATUS = " STATUS ")"
			exit
		}
		if (STATUS != "OK-COMP") {
			# this situation should never happen, except in the
			# particular case of Clean with its "kill-13" crashes;
			# in such case, STATUS should be equal to "KILL-COMP";
			# we just discard the current "exec" line, which is
			# irrelevant since the prior "comp" task has failed
			DISPLAY = 0
		} else {
			# here, STATUS == "OK-COMP"
			# here, $4 is "timeout", "kill-*", or an exit status
			if ($4 == "timeout") {
				STATUS = "TIME-EXEC"
			} else if ($4 ~ "kill-.*") {
				STATUS = "KILL-EXEC"
			} else if ($4 != 0) {
				STATUS = "FAIL-EXEC"
			} else {
				# assert $4 == 0
				STATUS = "OK"
			}
			TIMEXEC = $5
			MEMEXEC = $6
			RSSEXEC = $7
			TIMTOTAL = TIMCOMP + TIMEXEC
			MEMTOTAL = MEMCOMP + MEMEXEC
			RSSTOTAL = MEMCOMP + RSSEXEC
			# detection of the particular case where the "comp"
			# and "exec" phases succeded, but their total time
			# exceeds the timeout value (plus one second to avoid
			# rounding errors)
			if ((STATUS == "OK") && (TIMTOTAL > TIMEOUT + 1)) {
				STATUS = "TIME-BOTH-" TIMTOTAL"-"TIMEOUT
			}
		}
	}

	# affichage
	if (DISPLAY == 1) {
		ORS = ""
		print LANG " , " MODEL " , " STATUS
		if ((STATUS != "TIME-ALREADY") || (STATUS != "FAIL-ALREADY")) {
			print " , " TIMCOMP " , " MEMCOMP " , " RSSCOMP " , " TIMEXEC " , " MEMEXEC " , " RSSEXEC " , " TIMTOTAL " , " MEMTOTAL" , " RSSTOTAL
		}
		print "\n"
		ORS = "\n"
	}
}

