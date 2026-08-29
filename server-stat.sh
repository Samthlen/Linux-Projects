#!/usr/bin/env bash
#
# Analyze Linux Basic Server Stat
#
# Indicators for server performance
 
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# server stat display header

print_header() {
	echo -e "${YELLOW}"
	echo "==============================================="
	echo "            LINUX SERVER PERFOMANCE            "
	echo "==============================================="
	echo -e "${RESET}"
}

# Analyzes total cpu usage

check_cpu() { 
	echo
	echo "Total Cpu Usage"

	CPU_IDLE=$(top -bn1 | awk '/Cpu/  {print $8}' | cut -d'.' -f1)
	CPU_USAGE=$((100 - CPU_IDLE)) 

	echo "Cpu Usage: ${CPU_USAGE}%"
}
	
print_header
check_cpu

# Analyzes Memory Usage & Percentage 

mem_usage() {
	echo
	echo "Memory Usage & Percentage"

	free | grep "Mem" | awk '{printf "Total: %.1fGi\nUsed: %.1fMi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024, $3/$2 * 100,$4/1024^2, ($4/$2) * 100}'

}
mem_usage

# Analyzes Disk Usage & Percentage

check_disk_usage(){
	echo 
	echo "Disk Usage & Percentage"

	df -h | grep "/" -w | awk '{printf "Total: %sG\nUsed: %s (%.2f%%)\nFree: %s (%.2f%%)\n",$3 + $4, $3, $3/($3+$4) * 100,$4,$4/($3+$4)* 100}'
       
}
check_disk_usage
	
# Analyzes Top 5 processes by CPU Usage

check_processes() {
	echo
	echo "Top 5 processes by CPU Usage"
	ps -aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'

}
check_processes

# Analyzes Top 5 Processes by Memory Usage

processes_Mem() {
	echo
	echo "Top 5 processes by Memory Usage"
	ps -aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'
}
processes_Mem
