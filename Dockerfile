# Use an official OpenJDK runtime as a parent image
#FROM openjdk:11-jre-slim

# Set the working directory to /app
#WORKDIR /app

# Copy the JAR file into the container at /app
#COPY target/java-app.jar /app/

# Specify the command to run on container start
#CMD ["java", "-jar", "java-app.jar"]

# Use an official Maven image as a builder stage
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean install

# Use an official OpenJDK runtime as the final stage
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/your-app.jar .

# Specify the command to run on container start
CMD ["java", "-jar", "your-app.jar"]
