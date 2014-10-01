## ContentMine VM setup

## This script installs all ContentMine software for the workshop
## in a clean Debian 7 Wheezy virtual machine.
## It should not be run by participants.

echo password | sudo -S apt-get update -y

## Java 7
sudo apt-get install -y openjdk-7-jdk
sudo update-alternatives --config java
sudo update-alternatives --config javac


## XHTML2STM
wget https://bitbucket.org/petermr/xhtml2stm/downloads/xhtml2stm_0.4~SNAPSHOT_all.deb
sudo dpkg -i xhtml2stm_0.4~SNAPSHOT_all.deb
rm xhtml2stm_0.4~SNAPSHOT_all.deb


## ChemExtractor
wget https://bitbucket.org/mjw99/chemextractorpublic/downloads/chemextractor_1.0~SNAPSHOT_all.deb
sudo dpkg -i chemextractor_1.0~SNAPSHOT_all.deb
rm chemextractor_1.0~SNAPSHOT_all.deb


## Node.js
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash
nvm install v0.10.24
nvm use v0.10.24
nvm alias default v0.10.24

## Quickscrape
npm install --global quickscrape

## Journal-scrapers
sudo apt-get install -y git
cd ~
git clone https://github.com/ContentMine/journal-scrapers.git


## Workshop materials

cd ~
git clone https://github.com/ContentMine/ebi_workshop_20141006.git
