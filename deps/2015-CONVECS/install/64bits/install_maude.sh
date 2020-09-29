#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur MAUDE		 #
##########################################################################
#				18/05/2016				 #
##########################################################################


##########################################################################
#
# Hubert (28/09/2016): there is a simpler way to install Maude
# provided that all the required Debian packages have been installed
# (see install_debian.sh)
# 
#  DIR=$HOME/MAUDE
#  cd $DIR
#  wget http://maude.cs.illinois.edu/w/images/d/d8/Maude-2.7.1.tar.gz
#  tar xvpf Maude-2.7.1.tar.gz
#  cd maude-2.7.1
#  ./configure --with-cvc4=no --prefix=$DIR/maude-2.7.1
#  make
#  mkdir bin
#  cp src/Main/prelude.maude bin
#  cp src/Main/maude bin
#  # that's all
#
##########################################################################


set -e

# TODO : configurer gmake pour solaris
# export GNUMAKE=gmake

GETTEXT_ALREADY_HERE=0
FLEX_ALREADY_HERE=1
BUDDY_ALREADY_HERE=1
GMP_ALREADY_HERE=1
LIBTECLA_ALREADY_HERE=1
LIBSIGSEGV_ALREADY_HERE=1
MAUDE_ALREADY_HERE=0

DIR="$HOME/MAUDE"
LIB="$DIR/LIB"
CURRENT=$(pwd)

# creation du repertoire
mkdir -p $DIR
mkdir -p $LIB

#Ajout des librairies necessaires : gettext, flex, buddy, gmp, tecla, libsigsegv
cd $LIB
echo "Recuperation et extraction des librairies manquantes"

if [ "$GETTEXT_ALREADY_HERE" != 1 ]
then
	echo "Installation de gettext"
	wget http://ftp.gnu.org/pub/gnu/gettext/gettext-latest.tar.gz
	tar xzvf gettext-latest.tar.gz
	( cd gettext-0.19.8.1 ; ./configure --disable-shared --prefix=$LIB/gettext-0.19.8.1 ; make ; make check )
fi

if [ "$FLEX_ALREADY_HERE" != 1 ]
then
	echo "Installation de flex"
	wget https://sourceforge.net/projects/flex/files/flex-2.6.0.tar.bz2
	tar xvjf flex-2.6.0.tar.bz2
	( cd flex-2.6.0 ;  ./configure  --disable-shared --prefix=$LIB/flex-2.6.0 ; make ; make check )
fi

if [ "$BUDDY_ALREADY_HERE" != 1 ]
then
	echo "Installation de buddy"
	wget -O buddy-2.4.tar.gz http://sourceforge.net/projects/buddy/files/latest/download
	tar xzvf buddy-2.4.tar.gz
	( cd buddy-2.4 ; ./configure --disable-shared --prefix=$LIB/buddy-2.4 ; make ; make install )
fi

if [ "$GMP_ALREADY_HERE" != 1 ]
then
	echo "Installation de gmp"
	wget https://gmplib.org/download/gmp/gmp-6.1.0.tar.bz2
	tar xvjf gmp-6.1.0.tar.bz2
	( cd gmp-6.1.0 ; ./configure --enable-cxx --disable-shared --prefix=$LIB/gmp-6.1.0 ; make ; make check )
fi

if [ "$LIBTECLA_ALREADY_HERE" != 1 ]
then
	echo "Installation de tecla"
	wget http://www.astro.caltech.edu/~mcs/tecla/libtecla-1.6.3.tar.gz
	tar xzvf libtecla-1.6.3.tar.gz
	( cd libtecla ; ./configure CFLAGS="-O2 -D_POSIX_C_SOURCE=1" --prefix=$LIB/libtecla ; make  TARGETS=normal TARGET_LIBS=static )
fi

if [ "$LIBSIGSEGV_ALREADY_HERE" != 1 ]
then
	echo "Installation de sigsegv"
	wget http://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.10.tar.gz
	tar xzvf libsigsegv-2.10.tar.gz
	( cd libsigsegv-2.10 ; ./configure --prefix=$LIB/libsigsegv-2.10 ; make ; make check ; make install )
fi

if [ "$MAUDE_ALREADY_HERE" != 1 ]
then
	cd $DIR/
	echo "Chemin des librairies par defaut : $LD_LIBRARY_PATH"
	LD_LIBRARY_PATH="$LIB/ligsigsegv-2.10/lib:$LIB/libtecla-1.6.3/lib:$LIB/buddy-2.4/lib:$LIB/gmp-6.1.0/.libs:$LD_LIBRARY_PATH"
 	export LD_LIBRARY_PATH

	CPPF="-I$LIB/buddy-2.4/include -I$LIB/gmp-6.1.0 -I$LIB/libsigsegv-2.10/include -I$LIB/libtecla"
	# Recuperation de l'archive des codes sources
	echo "Recuperation de l'archive contenant les sources"
	wget http://maude.cs.illinois.edu/w/images/2/2d/Maude-2.7.tar.gz
	tar xzvf Maude-2.7.tar.gz

	cp $CURRENT/Maude2.7-patch/*.cc $DIR/Maude-2.7/src/Mixfix
	cp $CURRENT/Maude2.7-patch/*.yy $DIR/Maude-2.7/src/Mixfix
	( cd Maude-2.7 ; ./configure --prefix=$DIR/Maude-2.7/ GMP_LIBS="$LIB/gmp-6.1.0/.libs/libgmpxx.a $LIB/gmp-6.1.0/.libs/libgmp.a" LIBSIGSEGV_LIB="$LIB/libsigsegv-2.10/lib/libsigsegv.a" LDFLAGS="-static -L$LIB/libtecla-1.6.3/lib -L$LIB/buddy-2.4/lib -L$LIB/gmp-6.1.0/.libs" CPPFLAGS="$CPPF" ; echo "Installation des outil dans $DIR" ; make install )


	cp $DIR/Maude-2.7/share/prelude.maude $DIR/Maude-2.7/bin/prelude.maude
	echo "Les executables sont dans $DIR/Maude-2.7/bin"
fi

