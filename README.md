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
## Note: Must manually set corrisponding wireless interfaces in either "managed mode" (input / -i) + "monitor mode" (output \ -o) or "master mode" (for capable devices) using both "-o & -i" flags.
### Example: sudo airmon-ng start wlan1 or sudo ifconfig wlan1 mode master (or monitor) ...depending of the device(s) being used.
---
---
## Usage: ./apex [OPTIONS] [ARGUMENTS]
### OPTIONS:
### -d	Number of packets to send. (Default: 15)
### -h	Show this help screen.
### -i	IFace to listen for APs.
### -m	MAC of your AP (Default: 5C:7D:7D:33:31:01)
### -w	Seconds to wait after # of packets are sent (Default: .1)
### -o	IFace to send deauthentication packets.
### -r	Reason Code (Default: 7)
### Example: sudo ./apex -d 15 -r 7 -i wlan0 -o wlan1 -m 5C:7D:7D:33:31:01 -w .1
---
---
---
---
## INSTALLATION:
### git clone https://github.com/MBHudson/APEX-MassAP-Deauth.git
### cd APEX-MassAP-Deauth
### sudo chmod +x apex
### ./apex -h
---
---

<p align="center">
  <a href="https://github.com/MBHudson">
    <img src="https://github-readme-streak-stats.herokuapp.com/?user=alsiam&theme=radical&border=7F3FBF&background=0D1117" alt="Saif's GitHub streak"/>
  </a>
</p>

<p align="center">
  <a href="https://github.com/mbhudson">
    <img src="https://github-profile-summary-cards.vercel.app/api/cards/profile-details?username=mbhudson&theme=radical" alt="Al Siam's GitHub Contribution"/>
  </a>
</p>

<a> 
    <a href="https://github.com/MBHudson"><img alt="MBHudson's Github Stats" src="https://denvercoder1-github-readme-stats.vercel.app/api?username=mbhudson&show_icons=true&count_private=true&theme=react&border_color=7F3FBF&bg_color=0D1117&title_color=F85D7F&icon_color=F8D866" height="192px" width="49.5%"/></a>
  <a href="https://github.com/mbhudson"><img alt="MBHudson's Top Languages" src="https://denvercoder1-github-readme-stats.vercel.app/api/top-langs/?username=mbhudson&langs_count=8&layout=compact&theme=react&border_color=7F3FBF&bg_color=0D1117&title_color=F85D7F&icon_color=F8D866" height="192px" width="49.5%"/></a>
  <br/>
</a>


