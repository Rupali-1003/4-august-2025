#!/bin/bash

<<comment
This is my first project of automation using bash scripting
comment

mkdir -p logs
LOG_FILE="logs/system-$(date +%F).log"

myfun(){
    {
        echo "System details on $(date)"
        echo "Uptime of your system is:  $(uptime)"
        echo "Disk usage is:  $(free -h)"
        echo "CPU usage is: $(top -b -n1 | head -n 10)"
    } > "$LOG_FILE"
}

myfun

echo "System info saved to $LOG_FILE"

if [[ -f "$LOG_FILE" ]]; then
    echo "✅ Log file created successfully!"
else
    echo "❌ Failed to create log file."
fi

git add monitor.sh logs/
git commit -m "Update: auto-log and monitor.sh"
git push origin main

