#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur HASKELL		 #
##########################################################################
#				18/05/2016				 #
##########################################################################

set -e

# TODO : configurer gmake pour solaris
# export GNUMAKE=gmake

GMP_ALREADY_HERE=1
HASKELL_ALREADY_HERE=1

DIR="$HOME/HASKELL"
LIB="$DIR/LIB"

#creation du repertoire
mkdir -p $DIR
mkdir -p $LIB

if [ "$GMP_ALREADY_HERE" != 1 ]
then
	# Recuperation et extraction de la librairie manquante
	cd $LIB
	echo "Recuperation et extraction de la librairie libgmp manquante"
	#wget https://gmplib.org/download/gmp/gmp-6.1.0.tar.bz2
	tar xvjf gmp-6.1.0.tar.bz2
	cd gmp-6.1.0
	./configure --enable-cxx --disable-shared
	make
	make check
	cd ./.libs
	#Librairie attendue par ghc : libgmp.so.10
	ln -s libgmp.so.10.3.0 libgmp.so.10
fi


if [ "$HASKELL_ALREADY_HERE" != 1 ]
then
	echo "Chemin des librairies par defaut : $LD_LIBRARY_PATH"
	LD_LIBRARY_PATH="/$LIB/gmp-6.1.0/.libs:$LD_LIBRARY_PATH"

	cd $DIR
	# Recuperation de l'archive des codes sources
	echo "Recuperation de l'archive contenant les sources"
	#wget http://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-i386-deb8-linux.tar.bz2

	# Extraction de cette archive dans un repertoire nomme HASKELL
	echo "Extraction des fichiers de l'archive dans $DIR"
	tar xvjf ghc-7.10.3-i386-deb8-linux.tar.bz2
	cd ghc-7.10.3
	# tar xvjf ghc-7.2.1-i386-unknown-linux.tar.bz2 
	# cd ghc-7.2.1


	# Configurer le systeme en changeant le LD_LIBRARY_PATH
	echo "Configuration de HASKELL dans $DIR"
	export LD_LIBRARY_PATH
	./configure --prefix=$DIR

	echo "Installation des outil dans $DIR"
	make install

	echo "Les executables sont dans $DIR/bin"
fi
