#!/bin/bash

echo "Starting Student Marks System..."
echo "================================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker first."
    exit 1
fi

# Stop and remove existing containers
echo "Cleaning up previous containers..."
docker-compose down

# Start services
echo "Starting MySQL and Tomcat services..."
docker-compose up -d --build

# Wait for services to be ready
echo "Waiting for services to start..."
sleep 15

# Check if services are running
if [ "$(docker ps -q -f name=mysql-db)" ] && [ "$(docker ps -q -f name=tomcat-web)" ]; then
    echo "Services started successfully!"
    echo "Access your application at: http://localhost:8080/studentmarks.jsp"
    echo ""
    echo "Useful commands:"
    echo "  View logs: docker-compose logs -f"
    echo "  Stop services: docker-compose down"
else
    echo "Failed to start services. Check logs:"
    docker-compose logs
    exit 1
fi