#!/bin/sh

##########################################################################
#		 Fichier d'installation du compilateur RASCAL		 #
##########################################################################
#				18/05/2016				 #
##########################################################################

set -e

DIR="$HOME/RASCAL"

#creation du repertoire
mkdir -p $DIR

cd $HOME

if [ ! -d "$HOME/jdk1.8.0_91" ]
then
	# Java SDK 8 necessaire
	#The command below will not work as you need to accept a license agreement, so go to the web page in a browser and download it from there directly and move to your $HOME directory
	#wget http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-i586.tar.gz
	###-----Use This-----###
	#http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
	tar xzvf jdk-8u91-linux-i586.tar.gz
	export JAVA_HOME=$HOME/jdk1.8.0_91
	export PATH=$JAVA_HOME/bin:/$PATH
fi

if [ ! -d "$HOME/java-mars" ]
then
	# Eclipse  RCP and RAP Developers (Mars.2(4.5.2)) necessaire
	wget -O eclipse-inst-linux32.tar.gz 'https://www.eclipse.org/downloads/download.php?file=/oomph/epp/mars/R2/eclipse-inst-linux32.tar.gz&r=1'
	tar xzvf eclipse-inst-linux32.tar.gz
	echo "Selectionner \"Eclipse IDE for JAVA Developers\""
	echo "Selectionner Dossier d'installation: \"Installation Folder: $HOME/java-mars \" "
	( cd eclipse-installer ; ./eclipse-inst )

	#Configuration finale manuelle 
	echo "1 - Selectionner Help --> Install New Software"
	echo "2 - Verifier que la case \"Contact all update sites during install to find required software\" est cochee"
	echo "3 - Ajouter cette adresse dans le cadre \"Work With\" : http://update.rascal-mpl.org/stable/"
	echo "4 - Selectionner la case \"Rascal Metaprogramming language\" dans l'arbre Rascal"
	echo "5 - Cliquer sur Next et accepter la licence logicielle"
	echo "6 - Redemarrer Eclipse"
	( cd java-mars/eclipse ; ./eclipse )

	#ajouter ces flags au fichier eclipse.ini apres -vmargs
	echo "Verifier la version JDK, effective si >= 1.8 "
	echo "Modification du fichier eclipse.ini : "
	echo " Ajouter les flags suivants de ceux se trouvant apres -vmargs : \
		-server \
		-Xss32m \
		-Xms1024m \
		-Xmx1024m \
		-XX:MaxPermSize=256m \
		-Djava.net.preferIPv4Stack=true "
fi


# OU BIEN utilisation du .jar
cd $DIR
wget http://update.rascal-mpl.org/console/rascal-shell-stable.jar
#command de lancement : java -Xmx1G -Xss32m -jar rascal-shell-stable.jar

#export RASCAL="$HOME/RASCAL"
#export PATH="$RASCAL"
#alias rascal="cd $RASCAL; java -Xmx1G -Xss32m -jar rascal-shell-stable.jar"


