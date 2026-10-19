#!/bin/bash
echo "=== Server Health Report ==="

# 1. Check CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "CPU Usage: $CPU%"

# 2. Check RAM Usage
RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "RAM Usage: $RAM%"

# 3. Check Disk Usage
DISK=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Usage: $DISK"
echo "============================"
# 4. Check and Send Alerts if CPU or RAM exceeds 90%
if [ ${CPU%.*} -gt 90 ]; then
    echo "ALERT: CPU usage is critically high at $CPU%"
    # angalaeswari488@gmail.com
fi

if [ ${RAM%.*} -gt 90 ]; then
    echo "ALERT: RAM usage is critically high at $RAM%"
fi