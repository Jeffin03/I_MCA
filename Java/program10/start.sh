#!/bin/bash
# filepath: start.sh

echo "Starting JSP Tomcat Application..."
echo "=================================="

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker first."
    exit 1
fi

# Check if container already exists and is running
if [ "$(docker ps -q -f name=jsp-tomcat10)" ]; then
    echo "Container jsp-tomcat10 is already running!"
    echo "Access your application at: http://localhost:8080"
    exit 0
fi

# Check if container exists but is stopped
if [ "$(docker ps -aq -f status=exited -f name=jsp-tomcat10)" ]; then
    echo "Starting existing container..."
    docker start jsp-tomcat10
else
    echo "Building and starting new container..."
    docker-compose up -d --build
fi

# Wait for container to be ready
echo "Waiting for Tomcat to start..."
sleep 5

# Check if container is running
if [ "$(docker ps -q -f name=jsp-tomcat10)" ]; then
    echo "✅ Container started successfully!"
    echo "🌐 Access your application at: http://localhost:8080"
    echo "📋 Access arithmetic calculator at: http://localhost:8080/arithmetic.jsp"
    echo ""
    echo "📊 To view logs: docker logs jsp-tomcat10"
    echo "🛑 To stop: ./stop.sh"
else
    echo "❌ Failed to start container. Check logs:"
    docker logs jsp-tomcat10
    exit 1
fi