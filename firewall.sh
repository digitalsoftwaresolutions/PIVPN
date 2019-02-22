#!/bin/sh

iptables -F
iptables -t nat -F
iptables -X
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i tun0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o tun0 -j ACCEPT
echo "iptables MASQUERADE has been enabled"