#!/bin/bash
Log_File="system_monitor.log"
{
#First Check Disk Usage:
echo "Disk Usage Check:"
df -h / | grep / # -h for readable format

echo "------------------------------------"

# setting a threshold=80%
TH=80
#allowing user to decide the 

echo "------------------------------------"

# storing the percentage in a variable
Usage_percent=$(df --output=pcent / | awk 'NR==2 {print $1}' | tr -d '%')
TO_EMAIL="bodeygad99@gmail.com"  
SUBJECT="🚨 Disk Usage Warning!"
BODY="Warning: Disk usage has exceeded ${Usage_percent}% on $(hostname). Please check the system."

if (( Usage_percent > TH )) 
then 
   echo "Disk usage exceeded 80%!"
   echo -e "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"

    echo "Alert email sent to $TO_EMAIL!"
#Make sure to install mailutils.
else 
   echo "Disk usage is stable % (Normal)"
fi
echo "------------------------------------"

#Check CPU Usage:
top -n 1 | grep "Cpu(s)" | awk 'NR==1 {print "CPU Usage",  100 - $8 "%"}'

echo "------------------------------------"

#To show Memory Usage:
echo " Memory Usage "
free -h
echo "------------------------------------"

# Check top 5 Running Processes:
echo top 5 Running Processes
ps aux --sort=-%mem | head -n 6

echo "------------------------------------"


} >> $Log_File 
