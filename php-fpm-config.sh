#!/bin/bash

# Prompt the user for the number of CPU cores and amount of memory on the server
read -p "Enter the number of CPU cores: " cores
read -p "Enter the amount of memory (in GB): " memory

# Calculate the total number of available PHP-FPM processes
# (assume a process memory limit of 256 MB and convert memory input to MB)
processes=$((cores * (memory * 1024 / 256)))

# Calculate the recommended values for pm.max_children and pm.start_servers
pm_max_children=$processes
pm_start_servers=$((processes / 2))

# Calculate the recommended values for pm.max_spare_servers and pm.min_spare_servers
pm_max_spare_servers=$((pm_start_servers * 2))
pm_min_spare_servers=$((pm_start_servers / 2))

# Set the recommended value for pm.process_idle_timeout based on the workload
read -p "Enter the expected workload (low/medium/high): " workload
if [ "$workload" == "high" ]; then
  pm_process_idle_timeout=30
elif [ "$workload" == "medium" ]; then
  pm_process_idle_timeout=60
else
  pm_process_idle_timeout=90
fi

# Output the recommended configuration values
echo "Recommended PHP-FPM configuration:"
echo "pm.max_children = $pm_max_children"
echo "pm.start_servers = $pm_start_servers"
echo "pm.max_spare_servers = $pm_max_spare_servers"
echo "pm.min_spare_servers = $pm_min_spare_servers"
echo "pm.process_idle_timeout = $pm_process_idle_timeout"

# Output additional recommendations
echo
echo "Additional recommendations:"
echo "- Set the process memory limit in php.ini to 256 MB or less"
echo "- Monitor the performance of your server and adjust the configuration values as needed"
