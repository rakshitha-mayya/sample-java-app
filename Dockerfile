# Use an OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/your-app.jar .

# Specify the command to run on container start
CMD ["java", "-jar", "your-app.jar"]
