#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur OPAL		 #
##########################################################################
#				20/05/2016				 #
##########################################################################

set -e

# apt-get install flex

#  apt-get install libreadline-dev
# apt-get install libreadline6 ne suffit pas

# le configure d'OPAL n'est prevu quejusqu'a Tcl 8.5
# donc il vaut mieux faire

# apt-get install tcl8.5-dev
# apt-get install tk8.5-dev
# apt-get install libtcl8.5
# apt-get install tcl8.5
# apt-get install tk8.5

# que :

# apt-get install tcl-dev
# apt-get install tk-dev

# TODO : configurer gmake pour solaris
# export GNUMAKE=gmake

FLEX_ALREADY_HERE=1
READLINE_ALREADY_HERE=1
OPAL_ALREADY_HERE=1

DIR="$HOME/OPAL"
LIB="$DIR/LIB"

#creation du repertoire
mkdir -p $DIR
mkdir -p $LIB

cd $LIB

if [ "$FLEX_ALREADY_HERE" != 1 ]
then
	echo "Installation de flex"
	wget https://sourceforge.net/projects/flex/files/flex-2.6.0.tar.bz2
	tar xvjf flex-2.6.0.tar.bz2
	( cd flex-2.6.0 ; ./configure --prefix=$LIB/flex-2.6.0; make ; make check )
fi


if [ "$READLINE_ALREADY_HERE" != 1 ]
then
	echo "Installation de readline-lib"
	wget ftp://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz
	tar xzvf readline-6.3.tar.gz
	( cd readline-6.3 ; ./configure --prefix=$LIB/readline-6.3 ; make ; make check )
fi

if [ "$OPAL_ALREADY_HERE" != 1 ]
then
	echo "Chemin des librairies par defaut : $LD_LIBRARY_PATH"
	LD_LIBRARY_PATH="$LIB/readline-6.3/lib:$LIB/flex-2.6.0/lib:$LD_LIBRARY_PATH"

	cd $DIR
	# Recuperation de l'archive des codes sources
	echo "Recuperation de l'archive contenant les sources"
	wget http://projects.uebb.tu-berlin.de/opal/trac/raw-attachment/wiki/OCS/ocs-2.4b.tar.gz

	# Extraction de cette archive dans un repertoire nomme HASKELL
	echo "Extraction des fichiers de l'archive dans $DIR"
	tar xzvf ocs-2.4b.tar.gz
	cd ocs-2.4b
	# Configurer le systeme en changeant le LD_LIBRARY_PATH
	echo "Configuration de OPAL dans $DIR"
	export LD_LIBRARY_PATH
	./configure --prefix=$DIR/ocs-2.4b/dest
	echo "Installation des outil dans $DIR/ocs-2.4b/dest"
	make install
	echo "Les executables sont dans $DIR/ocs-2.4b/dest/bin"
fi
