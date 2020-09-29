
# Hubert Garavel -- quick-and-dirty REC translators

/^RULES$/,/^END-SPEC$/ {
	if ($1 == "RULES") {
	} else if ($1 == "END-SPEC") {
	} else {
		# here, $0 = <non-constructor> ... -> ...
		print $1
	}
} 

