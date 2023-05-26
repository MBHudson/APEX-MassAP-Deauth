# APEX-MassAP-Deauth
---
## HIGHLY ILLEGAL, NOT RESPONSIBLE FOR MISUSE!
TESTED ON PC, Rpi (ALL), WIFI PINAPPLE (ALL)
### -Advanced: Two interfaces mode, Master inferface mode
### - Choose reason code, attack duration and packets sent
---    
### Usage: ./apex [OPTIONS] [ARGUMENTS]

### OPTIONS:
### -d	Number of packets to send. (Default: 15)
### -h	Show this help screen.
### -i	IFace to listen for APs.
### -m	MAC of your AP (Default: 5C:7D:7D:33:31:01)
### -w	Seconds to wait after # of packets are sent (Default: .1)
### -o	IFace to send deauthentication packets.
### -r	Reason Code (Default: 7)
### Example: sudo ./apex -d 15 -i wlan0 -o wlan1 -m 5C:7D:7D:33:31:01 -w .1
---
