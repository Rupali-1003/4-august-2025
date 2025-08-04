#! /bin/bash

<<comment
This is my first project of automation using bash scripting

comment

myfun(){
	echo "System details on $(date)"

	echo "Uptime of your system is:  $(uptime)"

	echo "Disk usage is:  $(free -h)"

	echo " CPU usage is: $(top -b -n1 | head -n 10) "
	
}
mkdir -p logs

LOG_FILE="logs/system-$( date +%F ).log"

myfun > "$LOG_FILE"

echo "System info saved to $LOG_FILE"
