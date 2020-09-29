
# Hubert Garavel -- quick-and-dirty REC translators

# this script imports the MODE variable

# for the old REC format

/^OPS$/,/^VARS$/ {
	if ($1 == "OPS") {
	} else if ($1 == "VARS") {
	} else {
		# here, $0 = <non-constructor> : ... -> ...
		print $1
	}
}

# for the new REC format

/^CONS$/,/^OPNS$/ {
	if ($1 == "CONS") {
	} else if ($1 == "OPNS") {
	} else {
		# here, $0 = <constructor> : ... -> ...
		if ((MODE == "CONSTRUCTOR") || (MODE == "ALL"))
			print $1
	}
}

/^OPNS$/,/^VARS$/ {
	if ($1 == "OPNS") {
	} else if ($1 == "VARS") {
	} else {
		# here, $0 = <non-constructor> : ... -> ...
		if ((MODE == "NON-CONSTRUCTOR") || (MODE == "ALL"))
			print $1
	}
}

