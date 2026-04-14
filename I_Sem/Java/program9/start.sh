#!/bin/bash

echo " Starting Program9 Servlet Application..."

# Stop any existing container
docker stop program9-container 2>/dev/null || true
docker rm program9-container 2>/dev/null || true

# Run new container
docker run -d --name program9-container -p 8080:8080 program9-servlet

echo "✅ Application started!"
echo "🌐 Access the form at: http://localhost:8080/program9/index.html"
echo "📊 Check status: docker logs program9-container"
echo "🛑 To stop: ./stop.sh"