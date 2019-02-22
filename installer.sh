#!/bin/sh

apt-get update
apt-get install hostapd dnsmasq openvpn -y
cp dhcpcd.conf /etc/dhcpcd.conf
cp dnsmasq.conf /etc/dnsmasq.conf
cp hostapd.conf /etc/hostapd/hostapd.conf
echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" > /etc/default/hostapd
sysctl -w net.ipv4.ip_forward=1
cp firewall.sh /etc/openvpn/firewall.sh
chmod +x /etc/openvpn/firewall.sh
cp auth.txt /etc/openvpn/auth.txt
cp profile.ovpn /etc/openvpn/profile.ovpn
echo "sudo openvpn --config /etc/openvpn/profile.ovpn --auth-user-pass /etc/openvpn/auth.txt --script-security 2 --up /etc/openvpn/firewall.sh" > /etc/rc.local
