#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur MLTON		 #
##########################################################################
#				23/06/2016				 #
##########################################################################

set -e

MLTON_ALREADY_HERE=1

DIR="$HOME/MLTON"

#creation du repertoire
mkdir -p $DIR

cd $DIR
if [ "$MLTON_ALREADY_HERE" != 1 ]
then
	# latest version until 23/06/2016
	wget -O mlton-20130715-2.x86-linux.tgz https://sourceforge.net/projects/mlton/files/mlton/20130715/mlton-20130715-2.x86-linux.tgz/download
	tar zxf mlton-20130715-2.x86-linux.tgz
	export PATH="$DIR/mlton-20130715-2/bin:$PATH"
fi
