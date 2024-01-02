
#!/bin/bash

# List of servers
servers=0

for server in "${servers[@]}"; do
    echo "Server: $server"
    
    # Disk space
    echo "Disk space:"
     ssh "root@$server" df -h
    
    # Memory
    echo "Memory:"
    ssh "root@$server" free -h
    
    # CPU
    echo "CPU:"
    ssh "root@$server" top -bn1 | grep "Cpu(s)"
    
    echo "---------------------------------"
done
