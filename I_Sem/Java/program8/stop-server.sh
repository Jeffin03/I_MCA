#!/bin/bash

# HttpStatusServer Docker Stop Script
# This script stops all running HttpStatusServer containers

echo "=================================="
echo "   HttpStatusServer Stop Script    "
echo "=================================="
echo

# Find and stop all my-tomcat-server containers
RUNNING_CONTAINERS=$(docker ps -q --filter ancestor=my-tomcat-server)

if [ -z "$RUNNING_CONTAINERS" ]; then
    echo "ℹ️  No HttpStatusServer containers are currently running."
else
    echo "🛑 Stopping HttpStatusServer containers..."
    docker stop $RUNNING_CONTAINERS
    echo "✅ All HttpStatusServer containers stopped."
    echo "📦 Stopped containers: $RUNNING_CONTAINERS"
fi

echo "=================================="
