#!/bin/bash

echo "🛑 Stopping Program7 Servlet Application..."

docker stop program7-container 2>/dev/null || true
docker rm program7-container 2>/dev/null || true

echo "✅ Application stopped!"