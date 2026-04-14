#!/bin/bash
cat > profile.txt << EOF
Name: Gokila
Department: Computer Science
College: Engineering College
Interests: AI, IoT, Databases
Location: Bangalore
EOF

touch backup.txt
cp profile.txt backup.txt

tail -n +3 profile.txt

cat > profile_modified.txt << EOF
Name: Gokila
Department: Information Technology
College: Engineering College
Interests: AI, IoT, Cloud Computing
Location: Bangalore
EOF

diff profile.txt profile_modified.txt

mkdir -p copied_files
cp profile.txt profile_modified.txt copied_files/
grep "AI" profile.txt