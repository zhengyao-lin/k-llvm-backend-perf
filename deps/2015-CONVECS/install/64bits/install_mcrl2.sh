#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur MCRL2		 #
##########################################################################
#				25/09/2016				 #
##########################################################################

set -e

CMAKE_ALREADY_HERE=1
BOOST_ALREADY_HERE=1
QT_ALREADY_HERE=1
LIBPTHREAD_ALREADY_HERE=1
XCBPROTO_ALREADY_HERE=1
LIBXCB_ALREADY_HERE=1
MCRL_ALREADY_HERE=0

DIR="$HOME/MCRL2"
LIB="$DIR/LIB"

#creation du repertoire
mkdir -p $DIR
mkdir -p $LIB

cd $LIB
# installation de cmake and boost
if [ "$CMAKE_ALREADY_HERE" != 1 ]
then
	wget https://cmake.org/files/v3.6/cmake-3.6.2-Linux-x86_64.tar.gz
	tar zxf cmake-3.6.2-Linux-x86_64.tar.gz
	export PATH="$LIB/cmake-3.6.2-Linux-x86_64/bin:$PATH"
fi


if [ "$BOOST_ALREADY_HERE" != 1 ]
then
	wget https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz
	tar zxf boost_1_61_0.tar.gz
	( cd boost_1_61_0 ; chmod +x bootstrap.sh tools/build/src/engine/build.sh ; ./bootstrap.sh  --prefix=$LIB/boost_1_61_0/ ; ./bjam --build-type=complete --layout=tagged --with-filesystem --with-serialization --with-signals --with-regex )
	export BOOST_ROOT="$LIB/boost_1_61_0"
fi

# NOTE: at this point you need root access to install the following packages for OpenGL:
# libgl1-mesa-dev
# libglu1-mesa-dev
# mesa-common-dev 

if [ "$QT_ALREADY_HERE" != 1 ]
then
	#Install dependencies first
	if [ "$LIBPTHREAD_ALREADY_HERE" != 1 ]
	then
		wget https://xcb.freedesktop.org/dist/libpthread-stubs-0.3.tar.gz
		tar zxf libpthread-stubs-0.3.tar.gz
		( cd libpthread-stubs-0.3 ; ./configure  --prefix=$LIB/libpthread-stubs-0.3/ ; make ; make install )
		export NEEDED_LIBS="$LIB/libpthread-stubs-0.3/lib/"
		export NEEDED_CFLAGS="$LIB/libpthread-stubs-0.3/"
	fi

	if [ "$XCBPROTO_ALREADY_HERE" != 1 ]
	then
		wget https://xcb.freedesktop.org/dist/xcb-proto-1.12.tar.gz
		tar zxf xcb-proto-1.12.tar.gz
		( cd xcb-proto-1.12 ; ./configure  --prefix=$LIB/xcb-proto-1.12/ ; make ; make install )
		export PKG_CONFIG_PATH="$LIB/xcb-proto-1.12/"
		export XCBPROTO_CFLAGS="$LIB/xcb-proto-1.12/share/"
		export XCBPROTO_LIBS="$LIB/xcb-proto-1.12/lib/"
		export PYTHONPATH="$LIB/xcb-proto-1.12/"
	fi

	if [ "$LIBXCB_ALREADY_HERE" != 1 ]
	then
		wget https://xcb.freedesktop.org/dist/libxcb-1.12.tar.gz
		tar zxf libxcb-1.12.tar.gz
		( cd libxcb-1.12 ; ./configure  --prefix=$LIB/libxcb-1.12/ ; make ; make install )
	fi
	
	#Start installing QT now
	wget http://download.qt.io/official_releases/qt/5.6/5.6.0/single/qt-everywhere-opensource-src-5.6.0.tar.gz
	tar zxf qt-everywhere-opensource-src-5.6.0.tar.gz
	( cd qt-everywhere-opensource-src-5.6.0 ; ./configure -prefix /home/mtabikh/MCRL2/LIB/qt-everywhere-opensource-src-5.6.0/qtbase -opensource -confirm-license -nomake tests -nomake examples -qt-xcb -skip wayland ; make )
	export QT_ROOT="$LIB/qt-everywhere-opensource-src-5.6.0"
fi


#installation de MCRL2
export CMAKE="$HOME/MCRL2/LIB/cmake-3.6.2-Linux-x86_64"
export PATH="$PATH:$CMAKE/bin"
export BOOST_ROOT=$HOME/MCRL2/LIB/boost_1_61_0/
export Qt5Core_DIR=$LIB/qt-everywhere-opensource-src-5.6.0/qtbase/lib/cmake/Qt5Core/
export Qt5OpenGL_DIR=$HOME/MCRL2/LIB/qt-everywhere-opensource-src-5.6.0/qtbase/lib/cmake/Qt5OpenGL
export Qt5Xml_DIR=$HOME/MCRL2/LIB/qt-everywhere-opensource-src-5.6.0/qtbase/lib/cmake/Qt5Xml/

cd $DIR
if [ "$MCRL_ALREADY_HERE" != 1 ]
then
	svn co https://svn.win.tue.nl/repos/MCRL2/trunk mCRL2
	( cd mCRL2/build ;  cmake $HOME/MCRL2/mCRL2/ -DCMAKE_INSTALL_PREFIX="$HOME/MCRL2/mCRL2/" -DCMAKE_BUILD_TYPE=Release ; cmake . ; make ; make install )
fi
