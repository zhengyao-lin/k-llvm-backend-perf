#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur TOM		 #
##########################################################################
#				18/05/2016				 #
##########################################################################

DIR="$HOME/TOM"

#creation du repertoire
mkdir -p $DIR

cd $DIR
#recuperation et extraction fichier binaires
wget https://gforge.inria.fr/frs/download.php/file/32253/tom-2.10.tar.gz
tar xzvf tom-2.10.tar.gz


export TOM_HOME="$DIR/tom-2.10"
export PATH="$TOM_HOME/bin:$PATH"
export CLASSPATH="$TOM_HOME/lib/tom-runtime-full.jar:$CLASSPATH:$DIR"
