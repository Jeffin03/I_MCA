#!/bin/bash

#################################################
# PROGRAM 1: BASIC UNIX SHELL COMMANDS
# (For Study / Reference Only - Not for Execution)
#################################################

############################
# 1. List directory contents
############################
: '
Use: Displays files and directories

ls -l     # detailed list
ls -a     # show hidden files
'

############################
# 2. Create a directory
############################
: '
Use: Creates a new directory

mkdir myfolder
'

############################
# 3. Remove directory
############################
: '
Use: Deletes an empty directory

rmdir myfolder

Use: Delete a non-empty directory

rm -r ./foldername
'

############################
# 4. Change directory
############################
: '
Use: Navigate between directories

cd ./<directory_name>
cd ..        # go back
cd ~         # home directory
'

############################
# 5. Display or concatenate files
############################
: '
Use: Shows contents or combines files

cat file.txt
cat file1.txt file2.txt
'

############################
# 6. Create empty file / update timestamp
############################
: '
Use: Creates a new empty file

touch newfile.txt
'

############################
# 7. Identify file type
############################
: '
Use: Displays file type

file filename.txt
'

############################
# 8. Word, line, and byte count
############################
: '
Use: Counts lines, words, characters

wc file.txt
wc -l file.txt   # lines
wc -w file.txt   # words
wc -c file.txt   # bytes
'

############################
# 9. Sort lines of text
############################
: '
Use: Sorts contents of a file

sort file.txt
sort -r file.txt    # reverse
sort -n file.txt    # numeric
'

############################
# 10. Extract sections from lines
############################
: '
Use: Cuts columns from text

cut -d"," -f1 employees.csv
'

############################
# 11. Search text using patterns
############################
: '
Use: Finds patterns in files

grep "error" logfile.txt
grep -i "hello" file.txt   # case insensitive
'

############################
# 12. Convert and copy files
############################
: '
Use: Low-level copy / disk operations

dd if=/dev/sda of=disk.img
'

############################
# 13. Display free disk space
############################
: '
Use: Shows disk space

df -h
'

############################
# 14. Disk usage of files/folders
############################
: '
Use: Shows space used

du -h
du -sh myfolder
'

############################
# 15. User resource limits
############################
: '
Use: Shows/sets user limits

ulimit -a
'

#################################################
# END OF FILE
#################################################