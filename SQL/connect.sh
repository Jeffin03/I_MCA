#!/bin/bash
echo "Connecting to MySQL interactive mode..."
echo "Password: root"
docker exec -it dbms_mysql mysql -u root -p