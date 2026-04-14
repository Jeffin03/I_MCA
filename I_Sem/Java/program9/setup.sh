#!/bin/bash

echo "Setting up Java Servlet Program9..."

# Download servlet API if not present
if [ ! -f "javax.servlet-api-4.0.1.jar" ]; then
    echo "Downloading Servlet API..."
    wget https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar
fi

# Clean previous builds
echo "Cleaning previous builds..."
rm -rf WEB-INF program9.war

# Create directory structure
echo "Creating directory structure..."
mkdir -p WEB-INF/classes

# Compile servlet using Docker (ensures Java 21 compatibility)
echo "Compiling servlet with Java 21..."
docker run --rm -v $(pwd):/workspace -w /workspace openjdk:21-jdk \
    javac -cp .:javax.servlet-api-4.0.1.jar -d WEB-INF/classes ExceptionDemoServlet.java

# Verify compilation
if [ ! -f "WEB-INF/classes/ExceptionDemoServlet.class" ]; then
    echo "Compilation failed!"
    exit 1
fi

# Create WAR file
echo "Creating WAR file..."
jar cvf program9.war index.html -C . WEB-INF/

# Build Docker image
echo "Building Docker image..."
docker build -t program9-servlet .

echo "Setup complete!"
echo "To run: ./start.sh"