#!/bin/bash
echo "Starting DBMS MySQL Server..."
docker-compose up -d
echo "Waiting for MySQL to be ready..."
sleep 10
echo "MySQL server is ready!"