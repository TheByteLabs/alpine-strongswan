#!/bin/ash

#accept and forward v4/v6 via NAT
sudo iptables -t nat -A POSTROUTING -s 10.2.0.0/24 -m policy --dir out --pol ipsec -j ACCEPT
sudo iptables -t nat -A POSTROUTING -s 10.2.0.0/24 -j MASQUERADE

#allow forwarding
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1

#start vpn server
sudo ipsec start --nofork
