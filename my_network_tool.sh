#!/bin/bash

while true; do

echo "Welcome to My Network Tool"
echo ""
echo "Menu"
echo ""

#Show IP Address
echo "1 - Show IP Address"
#
#Check Network Interface Information
echo "2 - Check Network Interface Information"
#
#Ping a Host
echo "3 - Ping a Host"
#
#Nmap Scan Radar
echo "4 - Scan Network with Nmap"
#
#Port Scan with Nmap
echo "5 - Port Scan with Nmap"
#
#Display routing table
echo "6 - Display routing table"
#
#Traceroute to Host
echo "7 - Traceroute to Host"
#
#Exit
echo "8 - Exit"



read -p "Choose an option (1-8): " option
    case $option in
    1)
        ifconfig | grep 'inet '
        ;;
    2) 
        ifconfig
        ;;
    3) 
        read -p "Enter host to ping: " host
        ping -c 4 "$host"
        ;;
    4) 
        nmap -sn 192.168.1.1/24
        ;;
    5) 
        read -p "Enter target for port scan: " target
        nmap "$target"
        ;;
    6) 
        route -n
        ;;
    7) 
        read -p "Enter host for traceroute: " host
        traceroute "$host"
        ;;
    8)
        clear
        exit 0
        ;;
    *)
        echo "Invalid option"
        ;;

    esac
done