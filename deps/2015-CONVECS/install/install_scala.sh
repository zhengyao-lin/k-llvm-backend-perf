#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur SCALA		 #
##########################################################################
#				18/05/2016				 #
##########################################################################


DIR="$HOME/SCALA"
LIB="$DIR/LIB"


#creation du repertoire
mkdir -p $DIR

#installation de scala
cd $DIR
wget http://downloads.typesafe.com/scala/2.11.8/scala-2.11.8.tgz
tar zxf scala-2.11.8.tgz

export PATH=$HOME/SCALA/scala-2.11.8/bin:/$PATH
