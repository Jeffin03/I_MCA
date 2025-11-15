#!/bin/bash

echo "HttpStatusServer Startup"
echo "========================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker first."
    exit 1
fi

# Stop any existing containers using port 8080
echo "Checking for existing containers on port 8080..."
EXISTING_CONTAINER=$(docker ps -q --filter "publish=8080")
if [ ! -z "$EXISTING_CONTAINER" ]; then
    echo "Stopping existing container: $EXISTING_CONTAINER"
    docker stop $EXISTING_CONTAINER > /dev/null
fi

# Build image
echo "Building my-tomcat-server image..."
docker build -t my-tomcat-server .

# Ask user for run mode
echo "Choose how to run the server:"
echo "1) Background mode (recommended)"
echo "2) Foreground mode - use Ctrl+C to stop"
echo
read -p "Enter choice (1 or 2) [default: 1]: " RUN_MODE
RUN_MODE=${RUN_MODE:-1}

echo "Starting HttpStatusServer..."

if [ "$RUN_MODE" = "2" ]; then
    echo "Running in FOREGROUND mode - press Ctrl+C to stop"
    echo "Access at: http://localhost:8080/HttpStatusServer/HttpStatusServlet"
    docker run -p 8080:8080 my-tomcat-server
    exit 0
else
    # Run in background
    CONTAINER_ID=$(docker run -d -p 8080:8080 my-tomcat-server)
fi

if [ $? -eq 0 ]; then
    echo "Server started successfully!"
    echo "Container ID: ${CONTAINER_ID:0:12}"
    echo
    echo "Access at: http://localhost:8080/HttpStatusServer/HttpStatusServlet"
    echo "With parameters: http://localhost:8080/HttpStatusServer/HttpStatusServlet?code=404"
    echo
    echo "Useful commands:"
    echo "  View logs: docker logs $CONTAINER_ID"
    echo "  Stop server: docker stop $CONTAINER_ID"
    echo
    echo "Server is starting up... (wait ~10-15 seconds)"
    
    # Check if container is running
    sleep 3
    if docker ps -q --filter "id=$CONTAINER_ID" > /dev/null; then
        echo "Server is running!"
    else
        echo "Container may have stopped. Check logs with: docker logs $CONTAINER_ID"
    fi
else
    echo "Failed to start server. Please check Docker setup."
    exit 1
fi