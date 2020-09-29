#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur SML		 #
##########################################################################
#				06/07/2016				 #
##########################################################################

set -e

SML_ALREADY_HERE=0

DIR="$HOME/SML"

#creation du repertoire
mkdir -p $DIR

cd $DIR
if [ "$SML_ALREADY_HERE" != 1 ]
then
	v=110.80               # latest version until 23/09/2016
	wget http://smlnj.cs.uchicago.edu/dist/working/$v/config.tgz
	tar zxf config.tgz
	# Edit the "config/targets" file to your taste.  If you leave this
	# file alone, you end up with a minimal installation.
	# One important edit adding 'nowhere' tool
	echo "Edit the file '$DIR/config/targets' to install 'nowhere' tool"
	echo "by uncommenting 'request nowhere'"
	echo "Then in a terminal, change directory to '$DIR'"
	echo "Type the following command config/install.sh"
	export PATH="$DIR/bin:$PATH"
fi
