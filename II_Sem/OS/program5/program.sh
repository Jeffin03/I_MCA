#!/bin/bash
echo "Count of users logged in:"
who | wc -l
echo ""
echo "Files in home directory:"
ls ~ -1
echo ""
echo "Processes with below normal priority:"
ps -eo pid,comm,ni --sort=ni | awk '$3 > 0 {print $0}'
echo "Running a background job using nohup..."
nohup sleep 100 &