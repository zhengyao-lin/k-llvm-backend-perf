
OLD - STRATEGO-2.0.0

# Web site :
# http://metaborg.org/en/latest/source/release/note/2.0.0.html?highlight=download

# Download StrategoXT distribution
# http://download.spoofax.org/update/release/2.0.0/strategoxt-distrib-2.0.0.tar

CORRECTION DE DEUX BUGS  STRATEGO-2.0.0

str empty.str 
Error: Unable to access jarfile /home/mtabikh/STRATEGO/strategoxt-2.0.0/share/strategoxt/bin/../share/strategoxt/strategoxt/strategoxt.jar

( cd $HOME/STRATEGO/strategoxt-2.0.0/share/strategoxt ; ln -s . share )

Error: Unable to access jarfile /home/mtabikh/STRATEGO/strategoxt-2.0.0/share/strategoxt/bin/../share/strategoxt/strategoxt/strategoxt.jar

( cd $HOME/STRATEGO/strategoxt-2.0.0/share/strategoxt/strategoxt ; ln -s . strategoxt )

str empty.str
result = d0

------------------------------------------------------------------------------


NEW - STRATEGO-2.1.0

http://www.metaborg.org/en/latest/source/download.html

http://artifacts.metaborg.org/service/local/repositories/releases/content/org/metaborg/strategoxt-distrib/2.1.0/strategoxt-distrib-2.1.0-bin.tar

# INSTALLATION

VERSION=2.1.0
DIR=$HOME/STRATEGO-$VERSION
ln -s $DIR $HOME/STRATEGO
mkdir $DIR
mv strategoxt-distrib-$VERSION-bin.tar $DIR
cd $DIR
mkdir strategoxt-$VERSION
cd strategoxt-$VERSION
tar xvf ../strategoxt-distrib-$VERSION-bin.tar

# CORRECTION DE BUG

modifier le fichier 
$DIR/strategoxt-2.1.0/share/strategoxt/bin/strategoxt-path
replace
    STRDIR=$DISTDIR/share/strategoxt/strategoxt
with
    STRDIR=$DISTDIR/strategoxt

# MODIFICATION DE la commande $DIR/strategoxt-2.1.0/share/strategoxt/bin/str

replace
    java -cp "$CLASSDIR:$STRJAR" "$JAVANAME"
with
    java ${STRJFLAGS:--Xss8m -Xmx1024m} -cp  "$CLASSDIR:$STRJAR" "$JAVANAME"

# TEST LANCEMENT DE STRATEGO

PATH="$PATH:$DIR/strategoxt-2.1.0/share/strategoxt/bin"

str fact.str



