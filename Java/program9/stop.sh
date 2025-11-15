#!/bin/bash

echo "🛑 Stopping Program9 Servlet Application..."

docker stop program9-container 2>/dev/null || true
docker rm program9-container 2>/dev/null || true

echo "✅ Application stopped!"