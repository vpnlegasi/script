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
clear
echo -e "================================================="
echo -e "#       Premium Auto Script By VPN Legasi       #"
echo -e "#-----------------------------------------------#"
echo -e "# For Debian 9 & Debian 10 64 bit               #"
echo -e "# For Ubuntu 18.04 & Ubuntu 20.04 64 bit        #"
echo -e "# For VPS with KVM and VMWare virtualization    #"
echo -e "# VPN Legasi PREMIUM                            #"
echo -e "#-----------------------------------------------#"
echo -e "# Thanks To                                     #"
echo -e "#-----------------------------------------------#"
echo -e "# ALLAH SWT                                     #"
echo -e "# https://t.me/vpnlegasi                        #"
echo -e "# My Family                                     #"
echo -e "# Google                                        #"
echo -e "# LauranceLE                                    #"
echo -e "# v2ray My                                      #"
echo -e "#                                               #"
echo -e "#-----------------------------------------------#"
echo -e "================================================="
