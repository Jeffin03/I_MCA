#!/bin/bash

#################################################
# LINUX COMMANDS NOTES
# Inodes, Redirection, Pipes & Process Control
# (For Study / Reference Only - Not for Execution)
#################################################

############################
# 1. Commands Related to Inodes
############################

# a) Display inode numbers
: '
Use: Shows inode number of files
Example:
ls -i
'

# b) Display detailed file information
: '
Use: Shows inode details
Example:
stat test.txt
'

# c) Display inode usage
: '
Use: Shows inode usage
Example:
df -i
'

# d) Find file using inode
: '
Example:
ls -i test.txt
find . -inum <inode_number>
'

# e) Delete file using inode
: '
Example:
find . -inum <inode_number> -exec rm {} \;
'

############################
# 2. I/O Redirection Commands
############################

# a) Output redirection
: '
Example:
ls > output.txt      # overwrite
ls >> output.txt     # append
'

# b) Error redirection
: '
Example:
apt update 2> error.txt
'

# c) Output + Error redirection
: '
Example:
apt update &> all.txt
'

# d) Input redirection
: '
Example:
wc -l < output.txt
'

# e) Here document
: '
Example:
cat << EOF
...
EOF
'

# f) Here string
: '
Example:
wc -w <<< "Operating System Lab"
'

############################
# 3. Commands for Piping
############################

# a) Basic pipe
: '
Example:
ls | wc -l
'

# b) Process search
: '
Example:
ps aux | grep bash
'

# c) Count lines
: '
Example:
cat output.txt | wc -l
'

# d) Page-wise display
: '
Example:
ls --help | less
'

# e) Kernel messages
: '
Example:
dmesg | tail
'

############################
# 4. Process Control Commands
############################

# a) Run in background
: '
Example:
sleep 100 &
'

# b) List jobs
: '
Example:
jobs
'

# c) Bring to foreground
: '
Example:
fg %1
'

# d) Resume in background
: '
Example:
bg %1
'

# e) Show processes
: '
Example:
ps
top
htop
'

# f) Change priority
: '
Example:
nice -n 5 sleep 100
'

# g) Suspend / Resume process
: '
Example:
kill -STOP <PID>
kill -CONT <PID>
'

# h) Kill process
: '
Example:
kill <PID>
kill -9 <PID>
'

#################################################
# END OF FILE
#################################################