#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

echo "Running as root..."

sleep 3

clear

echo "Updating Please Wait..."

service passwall stop

cd /root/

rm core-installer.sh

wget https://raw.githubusercontent.com/tryv/openwrt-passwall/main/core-installer.sh

chmod 777 core-installer.sh

cd /etc/init.d/

rm dldaemon

wget https://raw.githubusercontent.com/tryv/openwrt-passwall/main/amir

chmod +x /etc/init.d/dldaemon

/etc/init.d/dldaemon enable

cd /root/


/etc/init.d/dldaemon start

echo -e "${GREEN} Update Complated ! ${ENDCOLOR}"
