FROM tomcat:10.0-jdk11

# Remove default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your JSP files to webapps directory
COPY ./webapp/ /usr/local/tomcat/webapps/ROOT/

# Copy any additional JAR files if needed
# COPY ./lib/*.jar /usr/local/tomcat/lib/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]