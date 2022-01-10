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
current=$(uname -a | cut -d " " -f 3 | cut -d "-" -f 1)

html=$(curl -s 'https://kernel.ubuntu.com/~kernel-ppa/mainline/')
versions=$(echo "$html" | xmllint --format --html --xpath "//table/tr/td/a/text()" - | tr "/" "\n" | grep -e "^v")
versions_no_rc=$(echo "$versions" | grep -v -e "-rc")
latest_major=$(echo "$versions_no_rc" | tail -n 1)
latest=$(echo "$versions_no_rc" | grep -e "^$latest_major" | sort | tail -n 1)

if [ $current != $latest ]
then
  echo "New kernel version available: $latest (installed: $current)"
  mkdir $latest
  cd $latest

  echo ""

  html=$(curl -s "https://kernel.ubuntu.com/~kernel-ppa/mainline/$latest/")
  downloads=$(echo "$html" | xmllint --format --html --xpath "//table/tr/td/a/text()" - | sed 's/linux-/\nlinux-/g' | grep -e "linux-")
  header_all=$(echo "$downloads" | grep -e "_all.deb")
  images=$(echo "$downloads" | grep -e "_amd64.deb" | grep -e "-generic_")

  echo "Downloading $header_all..."
  wget --quiet "https://kernel.ubuntu.com/~kernel-ppa/mainline/$latest/$header_all"

  for image in $images
  do
    echo "Downloading $image..."
    wget --quiet "https://kernel.ubuntu.com/~kernel-ppa/mainline/$latest/$image"
  done

  echo ""

  echo "Kernel packages are located here: $(pwd)"
  echo "You can install them now with: 'sudo dpkg -i $(pwd)/*.deb"
else
  echo "Kernel is up-to-date"
fi
