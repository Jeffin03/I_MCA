#!/bin/bash

echo "Stopping Student Marks System..."
echo "================================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running."
    exit 1
fi

# Check if services are running
if [ "$(docker-compose ps -q)" ]; then
    echo "Stopping MySQL and Tomcat services..."
    docker-compose stop
    
    # Wait for graceful shutdown
    echo "Waiting for services to stop..."
    sleep 3
    
    echo "Services stopped successfully!"
else
    echo "No running services found."
fi

# Option to remove containers and data
read -p "Do you want to remove containers and data? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing containers, networks, and volumes..."
    docker-compose down --volumes
    echo "All containers and data removed completely!"
else
    echo "Services stopped but preserved. Use ./start.sh to restart."
fi

echo ""
echo "Useful commands:"
echo "  Restart services: ./start.sh"
echo "  View stopped containers: docker-compose ps -a"
echo "  Remove everything: docker-compose down --volumes --rmi all"