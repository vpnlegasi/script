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
echo -e  "$PURPLE  |  $yell VPN Legasi Premium Server Script by VPN Legasi$NC       $PURPLE|"
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
echo -e  "$PURPLE  |                     $yell Dashboard Menu$NC                   $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell usernew     : Create SSH & OpenVPN Account"
echo -e "   $green  2)$NC $yell trial       : Generate SSH & OpenVPN Trial Account"
echo -e "   $green  3)$NC $yell renew       : Extending SSH & OpenVPN Account Active Life"
echo -e "   $green  4)$NC $yell deluser     : Delete SSH & OpenVPN Account"
echo -e "   $green  5)$NC $yell cek         : Check User Login SSH & OpenVPN"
echo -e "   $green  6)$NC $yell member      : Check Daftar Member SSH & OpenVPN"
echo -e "   $green  7)$NC $yell delete      : Delete User Expired SSH & OpenVPN"
echo -e "   $green  8)$NC $yell autokill    : Set up Autokill SSH"
echo -e "   $green  9)$NC $yell ceklim      : Displays Users Who Do Multi Login SSH"
echo -e "   $green 10)$NC $yell restart     : Restart Service Dropbear, Squid3 & other"
echo -e "   $green 11)$NC $yell add-wg      : Create Wireguard Account"
echo -e "   $green 12)$NC $yell del-wg      : Delete Wireguard Account"
echo -e "   $green 13)$NC $yell cek-wg      : Check User Login Wireguard"
echo -e "   $green 14)$NC $yell renew-wg    : Extending Wireguard Account Active Life"
echo -e "   $green 15)$NC $yell wg show     : Check Wireguard User Interface"
echo -e "   $green 16)$NC $yell add-l2tp    : Creating L2TP Account"
echo -e "   $green 17)$NC $yell del-l2tp    : Deleting L2TP Account"
echo -e "   $green 18)$NC $yell renew-l2tp  : Extending L2TP Account Active Life"
echo -e "   $green 19)$NC $yell add-pptp    : Create Account PPTP"
echo -e "   $green 20)$NC $yell del-pptp    : Delete PPTP Account"
echo -e "   $green 21)$NC $yell renew-pptp  : Extending PPTP Account Active Life"
echo -e "   $green 22)$NC $yell cek-pptp    : Check User Login PPTP"
echo -e "   $green 23)$NC $yell add-sstp    : Create Account SSTP"
echo -e "   $green 24)$NC $yell del-sstp    : Delete SSTP Account"
echo -e "   $green 25)$NC $yell renew-sstp  : Extending SSTP Account Active Life"
echo -e "   $green 26)$NC $yell cek-sstp    : Check User Login SSTP"
echo -e "   $green 27)$NC $yell ssr menu    : Show Other SSR Menu"
echo -e "   $green 28)$NC $yell add-ssr     : Create SSR Account"
echo -e "   $green 29)$NC $yell del-ssr     : Deleting SSR Account"
echo -e "   $green 30)$NC $yell renew-ssr   : Extending SSR Account Active Life"
echo -e "   $green 31)$NC $yell add-ss      : Creating Shadowsocks Account"
echo -e "   $green 32)$NC $yell del-ss      : Delete Shadowsocks Account"
echo -e "   $green 33)$NC $yell renew-ss    : Extending Shadowsocks Account Active Life"
echo -e "   $green 34)$NC $yell cek-ss      : Check User Login Shadowsocks"
echo -e "   $green 35)$NC $yell add-ws      : Create V2RAY Vmess Websocket Account"
echo -e "   $green 36)$NC $yell del-ws      : Deleting V2RAY Vmess Websocket"
echo -e "   $green 37)$NC $yell renew-ws    : Extending Vmess Account Active Life"
echo -e "   $green 38)$NC $yell cek-ws      : Check User Login V2RAY"
echo -e "   $green 39)$NC $yell certv2vray  : Renew Certificate V2RAY Vmess"
echo -e "   $green 40)$NC $yell add-vless   : Create V2RAY Vless Websocket Account"
echo -e "   $green 41)$NC $yell del-vless   : Deleting V2RAY Vless Websocket"
echo -e "   $green 42)$NC $yell renew-vless : Extending Vless Account Active Life"
echo -e "   $green 43)$NC $yell cek-vless   : Check User Login V2RAY Vless"
echo -e "   $green 44)$NC $yell add-tr      : Create Trojan Account"
echo -e "   $green 45)$NC $yell del-tr      : Deleting Trojan Account"
echo -e "   $green 46)$NC $yell renew-tr    : Extending Trojan Account Active Life"
echo -e "   $green 47)$NC $yell cek-tr      : Check User Login Trojan"
echo -e "   $green 48)$NC $yell add-host    : Add Or Change Subdomain Host For VPS"
echo -e "   $green 49)$NC $yell autobackup  : Autobackup Data VPS"
echo -e "   $green 50)$NC $yell backup      : Backup Data VPS"
echo -e "   $green 51)$NC $yell restore     : Restore Data VPS"
echo -e "   $green 52)$NC $yell wbmn        : Webmin Menu"
echo -e "   $green 53)$NC $yell kernel-updt : Update To Latest Kernel"
echo -e "   $green 54)$NC $yell swapkvm     : Swap KVM Server"
echo -e "   $green 55)$NC $yell limit-speed : Limit Bandwith Speed Server"
echo -e "   $green 56)$NC $yell ram         : Check Usage of VPS Ram"
echo -e "   $green 57)$NC $yell reboot      : Reboot VPS"
echo -e "   $green 58)$NC $yell speedtest   : Speedtest VPS"
echo -e "   $green 59)$NC $yell update      : Update To Latest Script Version"
echo -e "   $green 60)$NC $yell info        : Displaying System Information"
echo -e "   $green 61)$NC $yell about       : Info Script Auto Install"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                $yell Script status : Premium$NC               $PURPLE|"
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
16) clear ; add-l2tp ;;
17) clear ; del-l2tp ;;
18) clear ; renew-l2tp ;;
19) clear ; add-pptp ;;
20) clear ; del-pptp ;;
21) clear ; renew-pptp ;;
22) clear ; cek-pptp ;;
23) clear ; add-sstp ;;
24) clear ; del-sstp ;;
25) clear ; renew-sstp ;;
26) clear ; cek-sstp ;;
27) clear ; ssr ;;
28) clear ; add-ssr ;;
29) clear ; del-ssr ;;
30) clear ; renew-ssr ;;
31) clear ; add-ss ;;
32) clear ; del-ss ;;
33) clear ; renew-ss ;;
34) clear ; cek-ss ;;
35) clear ; add-ws ;;
36) clear ; del-ws ;;
37) clear ; renew-ws ;;
38) clear ; cek-ws ;;
39) clear ; certv2vray ;;
40) clear ; add-vless ;;
41) clear ; del-vless ;;
42) clear ; renew-vless ;;
43) clear ; cek-vless ;;
44) clear ; add-tr ;;
45) clear ; del-tr ;;
46) clear ; renew-tr ;;
47) clear ; cek-tr ;;
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
x) clear ; exit ;;
* )echo  "Please enter an correct number or Ctrl+C to exit from menu";;
esac
