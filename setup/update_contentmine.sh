## This script updates ContentMine software
## that was previously installed with setup_contentmine.sh
## It simply calls out to the workshop Github repo to get the latest
## update script, then runs it.

wget -qO- https://raw.githubusercontent.com/ContentMine/ebi_workshop_20141006/master/setup/latest_updates.sh | bash
