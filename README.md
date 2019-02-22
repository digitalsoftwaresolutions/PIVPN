
# PIVPN

add your credentials in auth.txt <br>

replace profile.ovpn with your profile<br>

then run the installer

```
chmod +x installer.sh
sudo ./installer.sh
sudo reboot
```
# CAUTION 
This script overwrites following files : 
```
/etc/rc.local
/etc/openvpn/firewall.sh
/etc/openvpn/auth.txt
/etc/openvpn/profile.ovpn
/etc/dhcpcd.conf
/etc/dnsmasq.conf
/etc/hostapd/hostapd.conf
/etc/default/hostapd
```
so make backup if you have different config files 
# Compatibility
this script works with wlan0 / eth0 / tun0 so if your device names are different, update them in config files .<br>
# Tested Devices
RaspberryPI 2b
RaspberryPI 3