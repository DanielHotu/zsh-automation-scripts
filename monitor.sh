#!/bin/zsh

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'  

clear
echo -e "${CYAN}=================================================${NC}"
echo -e "${GREEN}      📊 SYSTEM MONITOR & HARDWARE INFO 📊       ${NC}"
echo -e "${CYAN}=================================================${NC}\n"

echo -e "${YELLOW}▶ Sistem și Timp de funcționare${NC}"
OS_NAME=$(sw_vers -productName)
OS_VERSION=$(sw_vers -productVersion)
UPTIME=$(uptime | awk -F'( |,|:)+' '{print $6 " ore, " $7 " minute"}')

echo "Sistem de operare : $OS_NAME $OS_VERSION"
echo "Uptime            : $UPTIME"
echo ""

echo -e "${YELLOW}▶ Hardware${NC}"
CPU_INFO=$(sysctl -n machdep.cpu.brand_string)
RAM_BYTES=$(sysctl -n hw.memsize)
RAM_GB=$((RAM_BYTES / 1024 / 1024 / 1024))

echo "Procesor (CPU)    : $CPU_INFO"
echo "Memorie (RAM)     : ${RAM_GB} GB"
echo ""

echo -e "${YELLOW}▶ Utilizare Resurse (Curentă)${NC}"
CPU_USAGE=$(top -l 1 -n 0 | awk '/CPU usage/ {print "User: " $3 ", System: " $5 ", Idle (Liber): " $7}')
RAM_USAGE=$(top -l 1 -s 0 | awk '/PhysMem/ {print $2 " folosiți, " $6 " liberi"}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5 " ocupat din " $2}')

echo "Încărcare CPU     : $CPU_USAGE"
echo "Utilizare RAM     : $RAM_USAGE"
echo "Stocare (Disk)    : $DISK_USAGE"
echo ""

echo -e "${YELLOW}▶ Statistici Extra${NC}"
BATT_PERCENT=$(pmset -g batt | grep -Eo '[0-9]+%')
BATT_STATUS=$(pmset -g batt | grep -o 'AC Power\|Battery Power' | sed 's/AC Power/Conectat la priză/;s/Battery Power/Pe baterie/')
WIFI_IP=$(ipconfig getifaddr en0 2>/dev/null || echo "Deconectat")

echo "Status Baterie    : $BATT_PERCENT ($BATT_STATUS)"
echo "Adresă IP Locală  : $WIFI_IP"
echo ""

echo -e "${YELLOW}▶ Top 5 Procese (după consumul de CPU)${NC}"
echo -e " ${CYAN}%CPU${NC} \t ${CYAN}COMANDĂ${NC}"
ps -e -o %cpu,comm | sort -nr | head -n 5 | awk '{printf " %-5s \t %s\n", $1, $2}'
echo -e "\n${CYAN}=================================================${NC}"
