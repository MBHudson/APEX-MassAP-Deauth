# APEX-MassAP-Deauth :: !HIGHLY ILLEGAL, NOT RESPONSIBLE FOR MISUSE!
---
## [!] TESTED ON PC (Debian/Ubuntu)
## [!] TESTED ON Rpi (ALL)
## [!] TESTED ON WIFI PINAPPLE (ALL)
---
---
### - Advanced: Two interfaces mode
### - Choose reason code, attack duration and packets sent
### - Can use "master mode" via capable wlan interface by matching both "-i" and "-o" flages with the same interface.
---
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
---
---
---
## INSTALLATION:
### git clone https://github.com/MBHudson/APEX-MassAP-Deauth.git
### cd APEX-MassAP-Deauth
### sudo chmod +x apex
### ./apex -h
