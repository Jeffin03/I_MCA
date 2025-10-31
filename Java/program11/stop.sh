#!/bin/bash
# filepath: stop.sh

echo "Stopping JSP Tomcat Application..."
echo "=================================="

# Check if container is running
if [ "$(docker ps -q -f name=jsp-tomcat11)" ]; then
    echo "Stopping container jsp-tomcat11..."
    docker stop jsp-tomcat11
    
    # Wait a moment for graceful shutdown
    sleep 2
    
    echo "✅ Container stopped successfully!"
else
    echo "Container jsp-tomcat11 is not running."
fi

# Option to remove container completely
read -p "Do you want to remove the container completely? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing container and images..."
    docker-compose down --rmi all --volumes
    echo "✅ Container and images removed completely!"
else
    echo "Container stopped but preserved. Use ./start.sh to restart."
fi