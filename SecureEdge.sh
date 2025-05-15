#!/bin/bash

LOG_FILE="secureedge_tool.log"

log_entry() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

while true; do
   clear
echo "======================================="
echo "         S E C U R E   E D G E         "
echo "======================================="
echo "     Network Monitoring Tool Menu      "
echo "---------------------------------------"
    echo "1 - Scan Network for Active Devices"
    echo "2 - Perform Port Scan on a Device"
    echo "3 - Ping a Host"
    echo "4 - Show Local Network Info"
    echo "5 - Identify Operating System of a Device"
    echo "9 - Exit"
    echo ""

    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter subnet (e.g. 192.168.1.0/24): " subnet
            echo "Scanning network for active devices..."
            log_entry "Initiated network scan on subnet: $subnet"
            nmap -sn "$subnet" | tee -a "$LOG_FILE"
            ;;
        2)
            read -p "Enter IP address to scan ports: " ip
            echo "Performing full port scan on $ip..."
            log_entry "Initiated port scan on: $ip"
            nmap -p- "$ip" | tee -a "$LOG_FILE"
            ;;
        3)
            read -p "Enter host to ping: " host
            echo "Pinging $host..."
            log_entry "Pinging host: $host"
            ping -c 4 "$host" | tee -a "$LOG_FILE"
            ;;
        4)
            echo "Displaying local network information..."
            ip a
            ;;
        5)
            read -p "Enter IP address to identify OS: " os_ip
            echo "Attempting OS detection on $os_ip (requires sudo)..."
            log_entry "Attempted OS detection on: $os_ip"
            sudo nmap -O "$os_ip" | tee -a "$LOG_FILE"
            ;;
        9)
            echo "Exiting SecureEdge Network Tool. Goodbye!"
            log_entry "User exited the tool."
            clear
            break
            ;;
        *)
            echo "Invalid option. Please choose a valid number."
            ;;
    esac

    echo ""
    read -p "Press Enter to return to the main menu..."
    clear
done