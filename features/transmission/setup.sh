# source: https://sbcguides.com/install-transmission-on-raspberry-pi/

echo "Installing transmission client..."

sudo apt update && sudo apt upgrade -y

# create folder structure
sudo mkdir -p /home/pi/data/downloads/{torrents,complete,incomplete}

# install transmission daemon
sudo apt install transmission-daemon -y

# stop client
sudo systemctl stop transmission-daemon

# set up user permissions
sudo usermod -aG debian-transmission pi
sudo chgrp -R debian-transmission /home/pi/data/downloads/incomplete
sudo chgrp -R debian-transmission /home/pi/data/downloads/complete
sudo chmod -R 770 debian-transmission /home/pi/data/downloads/incomplete
sudo chmod -R 770 debian-transmission /home/pi/data/downloads/complete

# get settings from github repo
sudo curl https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/transmission/settings/settings.json -o /etc/transmission-daemon/settings.json

# reload daemon config file
sudo systemctl daemon-reload

# start the transmission daemon back up
sudo systemctl start transmission-daemon