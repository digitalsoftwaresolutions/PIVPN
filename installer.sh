#!/bin/sh

sudo apt-get update
sudo apt-get install hostapd dnsmasq openvpn -y
sudo cp dhcpcd.conf /etc/dhcpcd.conf
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" > /etc/default/hostapd
sudo sysctl -w net.ipv4.ip_forward=1
sudo cp firewall.sh /etc/openvpn/firewall.sh
sudo chmod +x /etc/openvpn/firewall.sh
sudo cp auth.txt /etc/openvpn/auth.txt
sudo cp profile.ovpn /etc/openvpn/profile.ovpn
sudo sed '$isudo openvpn --config /etc/openvpn/profile.ovpn --auth-user-pass /etc/openvpn/auth.txt --script-security 2 --up /etc/openvpn/firewall.sh' /etc/rc.local > /etc/rc.local
