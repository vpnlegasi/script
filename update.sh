#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/vpnlegasi/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green                     UPDATE SCRIPT$NC               $NC"
echo -e "$green   =============================================$NC"
sleep 5
wget https://raw.githubusercontent.com/vpnlegasi/script/main/update.sh && chmod +x update.sh && screen -S update ./update.sh
rm -f /root/update.sh
