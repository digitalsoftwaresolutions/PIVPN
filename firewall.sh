#!/bin/sh

sudo iptables -F
sudo iptables -t nat -F
sudo iptables -X
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo iptables -A FORWARD -i tun0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o tun0 -j ACCEPT
echo "iptables MASQUERADE has been enabled"