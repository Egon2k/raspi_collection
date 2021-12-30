'''
https://github.com/n8henrie/fauxmo
'''

INSTALL_DIR="/home/pi/projects/python/fauxmo"

# install python3
sudo apt-get install python3 idle3

# create folder structure
mkdir -p $INSTALL_DIR

# download virtual environment for python
sudo apt-get install python3-venv

# create virtual environment
python3 -m venv $INSTALL_DIR/.venv

# change directory
cd $INSTALL_DIR

# activate virtual environment
source $INSTALL_DIR/.venv/bin/activate

# install fauxmo
python3 -m pip install fauxmo

# install wakeonlan
python3 -m pip install wakeonlan

# get config from repo
sudo curl https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/fauxmo/config/config.json -o $INSTALL_DIR/config.json

# add user to autostart
sudo useradd -r -s /bin/false fauxmo

# get service config from repo
sudo curl https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/fauxmo/extras/fauxmo.service -o /etc/systemd/system/fauxmo.service

# enable service
sudo systemctl enable fauxmo.service
sudo systemctl start fauxmo.service