red='\e[0;31m'
blue='\e[0;34m'
green='\e[0;32m'
lightgreen='\e[1;32m'
NC='\e[0m' # No Color

echo -e "${blue}Now updating all ContentMine software.${NC}"

echo password | sudo -S echo "" 1>/dev/null 2>/dev/null
echo -e "${lightgreen}(sudo authentication successful)${NC}"

## Workshop files
echo -e "${blue}Updating workshop files...${NC}"
cd ~/ebi_workshop_20141006 1>/dev/null 2>/dev/null
git pull 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## XHTML2STM
echo -e "${blue}Updating XHTML2STM...${NC}"
wget https://bitbucket.org/petermr/xhtml2stm/downloads/xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm xhtml2stm_0.4~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## ChemExtractor
echo -e "${blue}Updating ChemExtractor...${NC}"
wget https://bitbucket.org/mjw99/chemextractorpublic/downloads/chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
sudo dpkg -i chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
rm chemextractor_1.0~SNAPSHOT_all.deb 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## Quickscrape
echo -e "${blue}Updating quickscrape...${NC}"
npm update --global quickscrape 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

## Journal-scrapers
echo -e "${blue}Updating journal-scrapers...${NC}"
cd ~/journal-scrapers 1>/dev/null 2>/dev/null
git pull 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

echo -e "${blue}Installing any missing software...${NC}"
## Tesseract-OCR
sudo apt-get install -y tesseract-ocr 1>/dev/null 2>/dev/null

## Other useful installs
sudo apt-get install -y mercurial maven 1>/dev/null 2>/dev/null
echo -e "${lightgreen}done.${NC}"

echo -e "${green}All ContentMine software updates completed.${NC}"

echo "This window will close in 10 seconds"
sleep 10
