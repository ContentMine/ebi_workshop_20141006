red='\e[0;31m'
blue='\e[1;34m'
green='\e[0;32m'
lightgreen='\e[1;32m'
NC='\e[0m' # No Color

echo -e "${blue}Now updating all ContentMine software.${NC}"

echo password | sudo -S echo "" 1>/dev/null 2>/dev/null

## Workshop files
echo -ne "${blue}Updating workshop files...${NC}  "
cd ~/ebi_workshop_20141006 1>/dev/null 2>/dev/null
git pull 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## XHTML2STM
echo -ne "${blue}Updating XHTML2STM...${NC}  "
wget https://bitbucket.org/petermr/xhtml2stm/downloads/xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## ChemExtractor
echo -ne "${blue}Updating ChemExtractor...${NC}  "
wget https://bitbucket.org/mjw99/chemextractorpublic/downloads/chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## AMI2-POC
echo -ne "${blue}Updating AMI2-POC...${NC}  "
wget https://bitbucket.org/petermr/xhtml2stm/downloads/ami2-poc_0.0.2~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i ami2-poc_0.0.2~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm ami2-poc_0.0.2~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## Quickscrape
echo -ne "${blue}Updating quickscrape...${NC}  "
npm uninstall --global quickscrape 1>/dev/null 2>/dev/null
npm install --global quickscrape@0.2.8
echo -e "${lightgreen}done.${NC}"

## Journal-scrapers
echo -ne "${blue}Updating journal-scrapers...${NC}  "
cd ~/journal-scrapers 1>/dev/null 2>/dev/null
git pull 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

echo -ne "${blue}Installing any missing software...${NC}  "

## Tesseract-OCR
sudo apt-get install -y tesseract-ocr 1>/dev/null 2>/dev/null

## Other useful installs
sudo apt-get install -y mercurial maven avogadro 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

echo -e "${green}All ContentMine software updates completed.${NC}"

echo "This window will close in 10 seconds"
sleep 10
