#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
MYIP=$(wget -qO- ifconfig.co);
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
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
echo ""  
echo -e "$green                                                            $NC"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |  $yell VPN Legasi Premium Server Script by VPN Legasi$NC      $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
	echo -e "   $green CPU Model            :$NC $cname"
	echo -e "   $green CPU Frequency        :$NC $freq MHz"
	echo -e "   $green Number Of Cores      :$NC  $cores"
	echo -e "   $green CPU Usage            :$NC  $cpu_usage"
	echo -e "   $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
	echo -e "   $green Kernel               :$NC  `uname -r`"
	echo -e "   $green Total Amount Of RAM  :$NC  $tram MB"
	echo -e "   $green Used RAM             :$NC $red $uram$NC MB"
	echo -e "   $green Free RAM             :$NC  $fram MB"
	echo -e "   $green System Uptime        :$NC  $uptime "
	echo -e "   $green Isp Name             :$NC  $ISP"
        echo -e "   $green Ip Vps               :$NC  $IPVPS"	
	echo -e "   $green City                 :$NC  $CITY"
	echo -e "   $green Time                 :$NC  $WKT"
	echo -e "   $green Day                  :$NC  $DAY"
	echo -e "   $green Date                 :$NC  $DATE"
	echo -e "   $green Telegram             :$NC  https://t.me/vpnlegasi"
echo -e  "$PURPLE   -------------------------------------------------------"
echo -e  "$PURPLE  $green Traffic      $yell Download      Upload      Total"
echo -e  "$PURPLE  $green Today     $NC  $cyan  $dtoday        $utoday      $ttoday"
echo -e  "$PURPLE   -------------------------------------------------------"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                      $yell    Menu SSH$NC                  $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create SSH & OpenVPN Account"
echo -e "   $green  2)$NC $yell Generate SSH & OpenVPN Trial Account"
echo -e "   $green  3)$NC $yell Extending SSH & OpenVPN Account Active Life"
echo -e "   $green  4)$NC $yell Delete SSH & OpenVPN Account"
echo -e "   $green  5)$NC $yell Check User Login SSH & OpenVPN"
echo -e "   $green  6)$NC $yell Check Daftar Member SSH & OpenVPN"
echo -e "   $green  7)$NC $yell Delete User Expired SSH & OpenVPN"
echo -e "   $green  8)$NC $yell Set up Autokill SSH"
echo -e "   $green  9)$NC $yell Displays Users Who Do Multi Login SSH"
echo -e "   $green 10)$NC $yell Restart Service Dropbear, Squid3 & other"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                      $yell  Menu Wireguard$NC               $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 11)$NC $yell Create Wireguard Account"
echo -e "   $green 12)$NC $yell Delete Wireguard Account"
echo -e "   $green 13)$NC $yell Check User Login Wireguard"
echo -e "   $green 14)$NC $yell Extending Wireguard Account Active Life"
echo -e "   $green 15)$NC $yell Check Wireguard User Interface"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                      $yell  Menu V2Ray Vmess$NC             $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 16)$NC $yell Create V2RAY Vmess Websocket Account"
echo -e "   $green 17)$NC $yell Deleting V2RAY Vmess Websocket"
echo -e "   $green 18)$NC $yell Extending Vmess Account Active Life"
echo -e "   $green 19)$NC $yell Check User Login V2RAY"
echo -e "   $green 20)$NC $yell Renew Certificate V2RAY Vmess"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                     $yell  Menu V2Ray Vless$NC              $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 21)$NC $yell Create V2RAY Vless Websocket Account"
echo -e "   $green 22)$NC $yell Deleting V2RAY Vless Websocket"
echo -e "   $green 23)$NC $yell Extending Vless Account Active Life"
echo -e "   $green 24)$NC $yell Check User Login V2RAY Vless"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                      $yell    Menu Trojan$NC                $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 25)$NC $yell Create Trojan Account"
echo -e "   $green 26)$NC $yell Deleting Trojan Account"
echo -e "   $green 27)$NC $yell Extending Trojan Account Active Life"
echo -e "   $green 28)$NC $yell Check User Login Trojan"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                  $yell Menu L2TP , PPTP & SSTP$NC           $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 29)$NC $yell Creating L2TP Account"
echo -e "   $green 30)$NC $yell Deleting L2TP Account"
echo -e "   $green 31)$NC $yell Extending L2TP Account Active Life"
echo -e "   $green 32)$NC $yell Create Account PPTP"
echo -e "   $green 33)$NC $yell Delete PPTP Account"
echo -e "   $green 34)$NC $yell Extending PPTP Account Active Life"
echo -e "   $green 35)$NC $yell Check User Login PPTP"
echo -e "   $green 36)$NC $yell Create Account SSTP"
echo -e "   $green 37)$NC $yell Delete SSTP Account"
echo -e "   $green 38)$NC $yell Extending SSTP Account Active Life"
echo -e "   $green 39)$NC $yell Check User Login SSTP"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                  $yell.  Menu SSR & Shadowsoks$NC            $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 40)$NC $yell Show Other SSR Menu"
echo -e "   $green 41)$NC $yell Create SSR Account"
echo -e "   $green 42)$NC $yell Deleting SSR Account"
echo -e "   $green 43)$NC $yell Extending SSR Account Active Life"
echo -e "   $green 44)$NC $yell Creating Shadowsocks Account"
echo -e "   $green 45)$NC $yell Delete Shadowsocks Account"
echo -e "   $green 46)$NC $yell Extending Shadowsocks Account Active Life"
echo -e "   $green 47)$NC $yell Check User Login Shadowsocks"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                        $yell Menu VPS$NC                     $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 48)$NC $yell Add Or Change Subdomain Host For VPS"
echo -e "   $green 49)$NC $yell Autobackup Data VPS"
echo -e "   $green 50)$NC $yell Backup Data VPS"
echo -e "   $green 51)$NC $yell Restore Data VPS"
echo -e "   $green 52)$NC $yell Webmin Menu"
echo -e "   $green 53)$NC $yell Update To Latest Kernel"
echo -e "   $green 54)$NC $yell Swap KVM Server"
echo -e "   $green 55)$NC $yell Limit Bandwith Speed Server"
echo -e "   $green 56)$NC $yell Check Usage of VPS Ram"
echo -e "   $green 57)$NC $yell Reboot VPS"
echo -e "   $green 58)$NC $yell Speedtest VPS"
echo -e "   $green 59)$NC $yell Update To Latest Script Version"
echo -e "   $green 60)$NC $yell Displaying System Information"
echo -e "   $green 61)$NC $yell Info Script Auto Install"
echo -e "   $green 62)$NC $yell Change Port for Some of Service"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                   $yell Script By VPN Legasi$NC               $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e   ""
read -p "     Select From Options [1-8 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; usernew ;;
2) clear ; trial ;;
3) clear ; renew ;;
4) clear ; deluser ;;
5) clear ; cek ;;
6) clear ; member ;;
7) clear ; delete ;;
8) clear ; autokill ;;
9) clear ; ceklim ;;
10) clear ; restart ;;
11) clear ; add-wg ;;
12) clear ; del-wg ;;
13) clear ; cek-wg ;;
14) clear ; renew-wg ;;
15) clear ; wg show ;;
16) clear ; add-ws ;;
17) clear ; del-ws ;;
18) clear ; renew-ws ;;
19) clear ; cek-ws ;;
20) clear ; certv2vray ;;
21) clear ; add-vless ;;
22) clear ; del-vless ;;
23) clear ; renew-vless ;;
24) clear ; cek-vless ;;
25) clear ; add-tr ;;
26) clear ; del-tr ;;
27) clear ; renew-tr ;;
28) clear ; cek-tr ;;
29) clear ; add-l2tp ;;
30) clear ; del-l2tp ;;
31) clear ; renew-l2tp ;;
32) clear ; add-pptp ;;
33) clear ; del-pptp ;;
34) clear ; renew-pptp ;;
35) clear ; cek-pptp ;;
36) clear ; add-sstp ;;
37) clear ; del-sstp ;;
38) clear ; renew-sstp ;;
39) clear ; cek-sstp ;;
40) clear ; ssr ;;
41) clear ; del-vless ;;
42) clear ; add-ssr ;;
43) clear ; renew-ssr ;;
44) clear ; add-ss ;;
45) clear ; del-ss ;;
46) clear ; renew-ss ;;
47) clear ; cek-ss ;;
48) clear ; add-host ;;
49) clear ; autobackup ;;
50) clear ; backup ;;
51) clear ; restore ;;
52) clear ; wbmn ;;
53) clear ; kernel-updt ;;
54) clear ; swapkvm ;;
55) clear ; limit-speed ;;
56) clear ; ram ;;
57) clear ; reboot ;;
58) clear ; speedtest ;;
59) clear ; update ;;
60) clear ; info ;;
61) clear ; about ;;
62) clear ; change-port ;;
x) clear ; exit ;;
* )echo  "Please enter an correct number or ( X ) to exit from menu";;
esac
