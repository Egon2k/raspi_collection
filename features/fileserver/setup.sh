echo "Installing samba file server..."

sudo apt update && sudo apt upgrade -y

# install necessary packages
sudo apt-get install samba samba-common-bin -y

# move standard config file
sudo mv /etc/samba/smb.conf /etc/samba/backup_smb.conf

# make directory for data
sudo mkdir -p /home/pi/data

# get config from github repo
sudo curl https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/fileserver/cfg/smb.conf -o /etc/samba/smb.conf

# restart smbd service
sudo service smbd restart

echo "waiting 10 seconds for samba to restart..."
sleep 10

# set/password for pi user
sudo smbpasswd -a pi

