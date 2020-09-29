#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur OCAML		 #
##########################################################################
#		18/05/2016 (update 2017/06/08)				 #
##########################################################################

set -e

# TODO : configurer gmake pour solaris
# export GNUMAKE=gmake

# VERSION=4.03
# SUBVERSION=0

VERSION=4.04
SUBVERSION=1

DIR="$HOME/OCAML"

#creation du repertoire
mkdir -p $DIR
cd $DIR

# Recuperation de l'archive des codes sources
echo "Recuperation de l'archive contenant les sources"
wget http://caml.inria.fr/pub/distrib/ocaml-$VERSION/ocaml-$VERSION.$SUBVERSION.tar.gz

# Extraction de cette archive dans un repertoire nomme OCAML
echo "Extraction des fichiers de l'archive dans $DIR"
tar xzvf ocaml-$VERSION.$SUBVERSION.tar.gz
cd ocaml-$VERSION.$SUBVERSION

# Configurer le systeme
echo "Configuration d'OCAML dans $DIR"
./configure -prefix $DIR

# faire make world depuis le repertoire initial, creation du bytecode du compilateur
make world

# Build le code natif du compilateur 
make opt
make opt.opt

echo "Installation des outil dans $DIR"
make install

echo "Installation reussie"


