
lundi 24 octobre 2016, 10:34:24 (UTC+0200)

Hubert Garavel

Clean 2.4

Radboud University Nijmegen

http://clean.cs.ru.nl/Clean

-------------------------------------------------------------------------------

Clean 2.4 with libraries (Intel, 32bit)

cd
mkdir CLEAN
cd CLEAN

wget http://clean.cs.ru.nl/download/Clean24/linux/clean2.4.tar.gz
gunzip clean2.4.tar.gz
tar xvpf clean2.4.tar
rm clean2.4.tar
cd clean
make

# pour avoir une version plus recente que la version 2.4
# commencer par sauvegarder ./clean
mv clean clean2.4-stable

wget http://ftp.cs.ru.nl/Clean/builds/linux-x86/clean-classic-linux-x86-latest.tgz
gunzip clean-classic-linux-x86-latest.tgz
tar xvpf clean-classic-linux-x86-latest.tar 
rm clean-classic-linux-x86-latest.tar 
cd clean
make

-------------------------------------------------------------------------------

Clean 2.4 with libraries (Intel, 64bit)

cd
mkdir CLEAN
cd CLEAN
wget http://clean.cs.ru.nl/download/Clean24/linux/clean2.4_64.tar.gz
gunzip clean2.4_64.tar.gz
tar xvpf clean2.4_64.tar
rm clean2.4_64.tar
cd clean
make

# pour avoir une version plus recente que la version 2.4
# commencer par sauvegarder ./clean
mv clean clean2.4-stable

wget http://ftp.cs.ru.nl/Clean/builds/linux-x64/clean-classic-linux-x64-latest.tgz
gunzip clean-classic-linux-x64-latest.tgz
tar xvpf clean-classic-linux-x64-latest.tar
rm clean-classic-linux-x64-latest.tar
cd clean
make

-------------------------------------------------------------------------------

