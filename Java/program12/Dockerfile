FROM tomcat:10-jdk21

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Create webapp directory
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Download MySQL Connector/J (updated URL for version 8.0.33)
RUN wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar \
    -O /usr/local/tomcat/lib/mysql-connector-j-8.0.33.jar

# Copy webapp files
COPY studentmarks.jsp /usr/local/tomcat/webapps/ROOT/

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]