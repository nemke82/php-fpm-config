# php-fpm-config
Simple Bash script to generate solid php-fpm configuration based on CPU/RAM resource

Here is one possible approach:

- Begin by prompting the user to input the number of CPU cores and the amount of memory on the server. <BR>
- Next, calculate the total number of available PHP-FPM processes based on the available CPU cores and memory. A common rule of thumb is to allow one PHP-FPM process per CPU core and to limit the total number of processes to the amount of available memory divided by the process memory limit (which you can set in the php.ini file). <BR>
- Based on the total number of available processes, calculate the recommended values for the pm.max_children and pm.start_servers parameters. A good starting point might be to set pm.max_children to the total number of available processes and pm.start_servers to half of that number. <BR>
- Calculate the recommended values for the pm.max_spare_servers and pm.min_spare_servers parameters based on the number of pm.start_servers. A good starting point might be to set pm.max_spare_servers to twice the number of pm.start_servers and pm.min_spare_servers to half of that number. <BR>
- Set the value of the pm.process_idle_timeout parameter based on the expected workload of the server. If the server is expected to have a high volume of requests, you may want to set a lower value to ensure that idle processes are terminated quickly. If the server is expected to have a low volume of requests, you may want to set a higher value to avoid unnecessarily terminating idle processes. <BR>
- Output the calculated configuration values to the user, along with any additional recommendations or considerations.
<BR>

This is just one possible approach, and you may need to adjust the details based on your specific needs and requirements.

To use this script, save it to a file (e.g., php-fpm-config.sh) and make it executable with the chmod command (e.g., chmod +x php-fpm-config.sh). Then, you can run it with the ./php-fpm-config.sh command. The script will prompt you for the number of CPU cores and the amount of memory on the server, and then output the recommended PHP-FPM configuration values based on these inputs.
