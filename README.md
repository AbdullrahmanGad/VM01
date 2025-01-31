System Monitoring Bash Script.

This Bash script monitors system resource usage including disk usage, CPU usage, memory usage, and the top running processes. It checks disk usage against a threshold and sends an email alert if usage exceeds the defined limit.

Features: Disk Usage Check: Monitors disk usage, sends an email alert if usage exceeds 80%. CPU Usage: Displays the current CPU usage percentage. Memory Usage: Shows memory usage in a human-readable format. Top 5 Processes: Lists the top 5 memory-consuming processes.

Prerequisites: Before running the script, ensure you have the following tools installed:

#mailutils: Required to send email alerts.

#df, top, free, and ps: These utilities are used for gathering system information.

SCRIPT DETAILS:

Disk Usage Check: The script checks the disk usage of the root filesystem (/) and compares it with a threshold (default set to 80%). If the usage exceeds the threshold, an email is sent to the specified address.

Also Using gitops the user can use arguments ( -t , -f ) to set the Threshold Value and the log path.

CPU Usage: It uses the top command to display the current CPU usage percentage.

Memory Usage: The free -h command shows the memory usage in a human-readable format.

Top 5 Running Processes: It lists the top 5 memory-consuming processes on the system.

Log File: The script logs all the results to a file named system_monitor.log.

Expected O/P if memory exceeded 80%:

![Output](https://github.com/user-attachments/assets/265673ef-f745-49b8-bc32-5b3a49f38af1)


![Email](https://github.com/user-attachments/assets/8735183e-29ef-4926-a3ef-77971a36000a)

