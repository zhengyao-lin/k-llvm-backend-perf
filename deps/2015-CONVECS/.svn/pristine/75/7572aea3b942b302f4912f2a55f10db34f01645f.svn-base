# Hubert Garavel -- process csv file

BEGIN {
	FS = ","
}

{
	LANG = $1
	MODEL = $2
	STATUS = $3

	RAW [MODEL] = "x"

	COL [LANG] = "x"

	if (STATUS ~ ".*-ALREADY.*") {
		TABLE [LANG "+" MODEL] = "-"
	} else if (STATUS ~ "TIME.*") {
		TABLE [LANG "+" MODEL] = "TO"
	} else if (STATUS ~ "KILL.*") {
		TABLE [LANG "+" MODEL] = "KL"
	} else if (STATUS ~ "FAIL.*") {
		TABLE [LANG "+" MODEL] = "FL"
	} else {
		TABLE [LANG "+" MODEL] = "" # ok
	}
}

END {
	ORS = ""
	M = asorti (RAW)
	N = asorti (COL)
	# impression d'une premiere ligne d'entete
	# on prefixe "model" par "aaaaa" pour le rendre resistant a "sort -V"
	print "aaaaamodel , "
	for (J = 1; J <= N; J++) {
		LANG = COL [J]
		print LANG ", "
	}
	print "\n"
	# impression des lignes suivantes
	for (I = 1; I <= M; I++) {
		MODEL = RAW [I]
		MODEL_WITHOUT_INITIAL_SPACE = MODEL
		gsub ("^ ", "", MODEL_WITHOUT_INITIAL_SPACE)
		print MODEL_WITHOUT_INITIAL_SPACE
		for (J = 1; J <= N; J++) {
			LANG = COL [J]
			print ", " TABLE [LANG "+" MODEL] " "
		}
		print "\n"
	}
	ORS = "\n"
}


