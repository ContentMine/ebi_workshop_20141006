echo "Now updating all ContentMine software."

echo password | sudo -S "(sudo authentication successful)"

## Workshop files
cd ~/ebi_workshop_20141006
git pull

## XHTML2STM
wget https://bitbucket.org/petermr/xhtml2stm/downloads/xhtml2stm_0.4~SNAPSHOT_all.deb
sudo dpkg -i xhtml2stm_0.4~SNAPSHOT_all.deb
rm xhtml2stm_0.4~SNAPSHOT_all.deb

## ChemExtractor
wget https://bitbucket.org/mjw99/chemextractorpublic/downloads/chemextractor_1.0~SNAPSHOT_all.deb
sudo dpkg -i chemextractor_1.0~SNAPSHOT_all.deb
rm chemextractor_1.0~SNAPSHOT_all.deb

## Quickscrape
npm update --global quickscrape

## Journal-scrapers
cd ~/journal-scrapers
git pull

## Tesseract-OCR
sudo apt-get install -y tesseract-ocr

## Other useful installs
sudo apt-get install -y mercurial maven

echo "All ContentMine software updates completed."
