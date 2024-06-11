#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

service passwall stop >/dev/null 2>&1
service passwall2 stop >/dev/null 2>&1

cd

echo "Downloading latest version of Xray-core ..."
wget -q https://github.com/yichya/openwrt-xray/releases/download/v1.8.13/openwrt-xray_1.8.13-r1_mipsel_24kc.ipk -O /tmp/xray.ipk

if [[ -f /tmp/xray.ipk ]]; then
  echo -e "${GREEN} Download Successful ! ${ENDCOLOR}"
else
  echo -e "${RED} ERROR : Download Unsuccessful Check Internet Connection ${ENDCOLOR}"
  exit 1
fi

echo -e "${MAGENTA} INSTALLING XRAY ... ${ENDCOLOR}"
opkg install /tmp/xray.ipk -d ram

if [[ -f /tmp/xray.ipk ]]; then
  rm /tmp/xray.ipk
else
  echo "Stage 1 Passed"
fi

service passwall restart >/dev/null 2>&1
service passwall2 restart >/dev/null 2>&1

########

echo "Done !"
