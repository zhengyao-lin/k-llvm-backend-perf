
# Hubert Garavel -- quick-and-dirty REC translators

# this awk script builds a file that contains one line of the form "F"
# for each rewrite rule of the form "F -> ...", meaning that F is a 
# non-constructor operation, and that F is nullary (i.e., has no argument).
# There is some ad hoc processing for rules with premisses, as they do
# not define constants
# This file will help to discover constants defined by several equations

/^RULES$/,/^EVAL$/ {
	if ($1 == "RULES") {
	} else if ($1 == "EVAL") {
	} else {
		if ($2 == "->") {
			# the rule has the form "$1 -> ..."
			print $1
			PREMISS = index ($0, " if ")
			if (PREMISS != 0) {
				# the rule contains a premiss
				# we write another line on the output file
				# so as to prevent $1 to be a constant
				print $1
			}
		}
	} 
}
