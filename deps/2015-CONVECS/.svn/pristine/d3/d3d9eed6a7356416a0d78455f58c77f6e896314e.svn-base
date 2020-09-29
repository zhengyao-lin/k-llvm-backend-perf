# Hubert Garavel -- process csv file

BEGIN {
	FS = ","
	COMMON_TOTAL = -1
}

{
	LANG = $1
	MODEL = $2
	STATUS = $3

	if (! (LANG in SUCCESS)) {
		# this is the first line found dealing with LANG
		SUCCESS [LANG] = 0
		FAILURE [LANG] = 0
		CRASH   [LANG] = 0
		TIMEOUT [LANG] = 0
		TIM [LANG] = 0
		MEM [LANG] = 0
		RSS [LANG] = 0
	}

	if (STATUS ~ "TIME.*") {
		++ TIMEOUT [LANG]
	} else if (STATUS ~ "KILL.*") {
		++ CRASH [LANG]
	} else if (STATUS ~ "FAIL.*") {
		++ FAILURE [LANG]
	} else {
		# STATUS == "OK"
		++ SUCCESS [LANG]
	}
	TIM [LANG] += $10
	MEM [LANG] += $11
	RSS [LANG] += $12
}

END {
	for (LANG in SUCCESS) {
		# check that all tools have handled the same number of models
		TOTAL = SUCCESS [LANG] + FAILURE [LANG] + CRASH [LANG] + TIMEOUT [LANG] 
		if (COMMON_TOTAL == -1) {
			COMMON_TOTAL = TOTAL
		} else if (TOTAL != COMMON_TOTAL) {
			print "unexpected divergence for " LANG "on total: " TOTAL " vs " COMMON_TOTAL
		}
		# display the statistics
		ORS = ""
		print LANG ", " SUCCESS [LANG] " , " FAILURE [LANG] " , " CRASH [LANG] " , " TIMEOUT [LANG] " , "
		if (SUCCESS [LANG] == TOTAL) {
			print "100%"
		} else {
			printf "%.1f%%", (100 * SUCCESS [LANG] / TOTAL)
		}
		print " , " TIM [LANG] " , " MEM [LANG] " , " RSS [LANG] "\n"
		ORS = "\n"
	}
}


