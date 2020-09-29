#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur CADP		 #
##########################################################################
#				23/05/2016				 #
##########################################################################

set -e

CADP_ALREADY_HERE=1

DIR="$HOME/CADP"

# creation du repertoire
mkdir -p $DIR

if [ "$CADP_ALREADY_HERE" != 1 ]
then
	cd $DIR/
	
	# Recuperation de l'archive des codes sources
	echo "Recuperation de l'archive contenant les sources"
	wget ftp://ftp.inrialpes.fr/pub/vasy/cadp/installator.iX86/installator.shar .
	sh installer.shar
	rm installer.shar

	#Test the installation
	look INSTALLATION_2
	sh com/tst

	#Final steps to be done manually
	echo "Final steps to be done manually:"
	echo "step 1: Copy LICENSE file received by mail into $DIR"
	echo "step 2: Open a terminal and type: \"cd $DIR\""
	echo "step 3: Type in the terminal: \"chmod u+x LICENSE\""
fi

