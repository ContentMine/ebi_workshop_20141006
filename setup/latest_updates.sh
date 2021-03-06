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

## AMI-CORE
echo -ne "${blue}Updating AMI-CORE...${NC}  "
wget https://bitbucket.org/petermr/ami-core/downloads/ami-core_0.1_2015_01_06_SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i ami-core_0.1_2015_01_06_SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm ami-core_0.1_2015_01_06_SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## Norma
echo -ne "${blue}Updating Norma...${NC}  "
wget https://bitbucket.org/petermr/nhtml/downloads/nhtml_0.1~SNAPSHOT_2015_01_10_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i nhtml_0.1~SNAPSHOT_2015_01_10_all.deb 1>/dev/null 2>/dev/null
rm nhtml_0.1~SNAPSHOT_2015_01_10_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## Quickscrape
echo -ne "${blue}Updating quickscrape...${NC}  "
npm uninstall --global quickscrape 1>/dev/null 2>/dev/null
npm install --global quickscrape@0.3.6
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
