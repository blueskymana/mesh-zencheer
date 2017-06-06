#!/bin/sh /etc/rc.common

echo "The ebtables start !"

ipaddr=$(uci get mesh.@lan-iface[0].ipaddr)
bridge=$(uci get mesh.@mesh-iface[0].bridge)

ebtables -P FORWARD ACCEPT 
ebtables -P INPUT ACCEPT
ebtables -P OUTPUT ACCEPT
ebtables -F 
ebtables -A FORWARD -p ipv4 -i $bridge --ip-dst $ipaddr -j DROP
