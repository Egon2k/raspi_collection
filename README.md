# Raspberry Pi Collection

## System Requirements (Minimum)
- Raspberry Pi 1 Model B
- SD card with min. 8GB storage
- Raspbian 

## Prepare Raspbian
- Download operating system from https://www.raspberrypi.com/software/
- Format the SD Card and flash it with tools like [balena Etcher](https://www.balena.io/etcher/)
- Create a file named ```ssh``` in boot partition to enable SSH
- After first start, find the IP in Router settings and connect via SSH
  ```
  username:           pi
  password (default): raspberry
  ```
- change default password via
  ```
  passwd
  ```
- Configure raspbian by entering 
  ```
  sudo raspi-config
  ```
  - Expand file system (Advanced Options -> Expand file system)
  - Update
  - Reboot

## File Server

```
source <(curl -s https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/fileserver/setup.sh)
```

## Transmission
```
source <(curl -s https://raw.githubusercontent.com/Egon2k/raspi_collection/main/features/transmission/setup.sh)
```

