# Java Servlet Docker Setup Guide

## 📋 Complete Steps to Set Up a Java Servlet with Docker & Tomcat

This guide outlines the process to containerize any Java Servlet project using Docker and Apache Tomcat.

---

## 🎯 Prerequisites

- Java Development Kit (JDK) installed
- Docker installed and running
- Basic understanding of Java Servlets
- Terminal/Command line access

---

## 📁 Project Structure Setup

### Step 1: Create Directory Structure
```
your-project/
├── YourServlet.java              # Your servlet source code
├── Dockerfile                    # Docker configuration
├── start-server.sh              # Server start script
├── stop-server.sh               # Server stop script
├── javax.servlet-api-X.X.X.jar  # Servlet API dependency
├── YourProject.war              # Generated WAR file
└── WEB-INF/
    ├── web.xml                  # Servlet configuration
    └── classes/
        └── YourServlet.class    # Compiled servlet
```

---

## 🔧 Implementation Steps

### Step 2: Download Servlet API Dependencies
```bash
# Download the servlet API JAR file
wget https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar
```

### Step 3: Create Web Application Structure
```bash
# Create the required directories
mkdir -p WEB-INF/classes
```

### Step 4: Compile Your Servlet
```bash
# Compile with servlet API in classpath
javac -cp .:javax.servlet-api-4.0.1.jar -d WEB-INF/classes YourServlet.java
```

### Step 5: Create Servlet Configuration

**Option A: Using Annotations (Recommended)**
```java
@WebServlet("/YourServletPath")
public class YourServlet extends HttpServlet {
    // Your servlet code
}
```

**Option B: Using web.xml**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app>
  <servlet>
    <servlet-name>YourServlet</servlet-name>
    <servlet-class>YourServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>YourServlet</servlet-name>
    <url-pattern>/YourServletPath</url-pattern>
  </servlet-mapping>
</web-app>
```

### Step 6: Package as WAR File
```bash
# Create WAR file with proper structure
jar cvf YourProject.war -C . WEB-INF/
```

### Step 7: Create Dockerfile
```dockerfile
FROM tomcat:9.0
COPY YourProject.war /usr/local/tomcat/webapps/
EXPOSE 8080
```

### Step 8: Create Automation Scripts

**start-server.sh**
```bash
#!/bin/bash
# Script to build and run the Docker container
# Include error handling, port checking, and user options
```

**stop-server.sh**
```bash
#!/bin/bash
# Script to stop running containers
# Include cleanup and confirmation messages
```

### Step 9: Build and Run
```bash
# Make scripts executable
chmod +x start-server.sh stop-server.sh

# Build Docker image
docker build -t your-project-name .

# Run container
docker run -p 8080:8080 your-project-name
```

---

## 🚨 Common Issues and Solutions

### Java Version Compatibility
- **Problem**: `UnsupportedClassVersionError`
- **Solution**: Compile with same Java version as Docker container
- **Fix**: Use Docker to compile or match JDK versions

### Port Conflicts
- **Problem**: Port 8080 already in use
- **Solution**: Stop existing containers or use different port
- **Command**: `docker ps` and `docker stop <container-id>`

### Servlet API Missing
- **Problem**: Package does not exist errors
- **Solution**: Download and include servlet API JAR
- **Location**: Maven Central Repository

### WAR File Structure
- **Problem**: 404 errors or deployment failures
- **Solution**: Ensure proper WEB-INF directory structure
- **Check**: Classes in `WEB-INF/classes/`, web.xml in `WEB-INF/`

---

## 🎯 URL Structure Understanding

**Final URL Pattern:**
```
http://localhost:8080/[WAR-NAME]/[SERVLET-MAPPING]
```

**Example:**
- WAR file: `MyProject.war`
- Servlet mapping: `@WebServlet("/MyServlet")`
- Final URL: `http://localhost:8080/MyProject/MyServlet`

---

## 📝 Customization Points

### For Different Servlet Types:
- **REST APIs**: Add JSON processing libraries
- **Database Servlets**: Include JDBC drivers
- **File Upload**: Configure multipart handling
- **Security**: Add authentication filters

### For Different Environments:
- **Development**: Use foreground mode for logs
- **Production**: Use background mode with logging
- **Testing**: Add health check endpoints

### For Different Ports:
- **Change Dockerfile**: `EXPOSE 8081`
- **Change run command**: `-p 8081:8081`
- **Update scripts**: Modify port references

---

## 🔄 Reusable Template

### Quick Setup Checklist:
- [ ] Create project directory
- [ ] Download servlet API JAR
- [ ] Write servlet code with proper annotations
- [ ] Create WEB-INF structure
- [ ] Compile servlet with classpath
- [ ] Package as WAR file
- [ ] Create Dockerfile
- [ ] Write automation scripts
- [ ] Build and test Docker container
- [ ] Document access URLs

---

## 🚀 Advanced Enhancements

### Optional Additions:
- **Database Integration**: Add MySQL/PostgreSQL containers
- **Load Balancing**: Use multiple Tomcat instances
- **SSL/HTTPS**: Configure secure connections
- **Monitoring**: Add health check endpoints
- **Logging**: Configure log4j or similar
- **CI/CD**: Add GitHub Actions or Jenkins

### Docker Compose Option:
```yaml
version: '3'
services:
  webapp:
    build: .
    ports:
      - "8080:8080"
  database:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: password
```

---

## 📚 Key Learning Points

1. **Servlet Lifecycle**: Understanding deployment and execution
2. **Docker Concepts**: Images, containers, and networking
3. **Web Application Structure**: WAR files and directory layout
4. **Dependency Management**: Classpath and external libraries
5. **Automation**: Scripting for reproducible deployments

This process can be repeated for any Java Servlet project with minor modifications based on