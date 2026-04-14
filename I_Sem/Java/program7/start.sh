#!/bin/bash

echo "🚀 Starting Program7 Servlet Application..."

# Stop any existing container
docker stop program7-container 2>/dev/null || true
docker rm program7-container 2>/dev/null || true

# Run new container
docker run -d --name program7-container -p 8080:8080 program7-servlet

echo "✅ Application started!"
echo "🌐 Access the form at: http://localhost:8080/program7/form.html"
echo "📊 Check status: docker logs program7-container"
echo "🛑 To stop: ./stop.sh"