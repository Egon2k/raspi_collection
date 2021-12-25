# source: https://sbcguides.com/install-transmission-on-raspberry-pi/

echo "Installing transmission client..."

# create folder structure
mkdir -p /home/pi/data/downloads/{complete,incomplete}

# install transmission daemon
sudo apt install transmission-daemon -y

# stop client
sudo systemctl stop transmission-daemon

# add user pi to group debian-transmission
sudo usermod -aG debian-transmission pi

# add user debian-transmission to group debian-transmission
sudo usermod -aG debian-transmission debian-transmission

# recursivly change group for downloadsfolder to debian-transmission
sudo chgrp -R debian-transmission /home/pi/data/downloads

# change folders permissions
sudo chmod -R 550 /home/pi/data/downloads
sudo chmod -R 770 /home/pi/data/downloads/complete
sudo chmod -R 770 /home/pi/data/downloads/incomplete

# get settings from github repo
sudo curl https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/transmission/settings/settings.json -o /etc/transmission-daemon/settings.json

# reload daemon config file
sudo systemctl daemon-reload

# start the transmission daemon back up
sudo systemctl start transmission-daemon