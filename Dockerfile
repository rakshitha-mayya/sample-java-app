# FROM openjdk:8-jre-alpine

# EXPOSE 8080

# COPY src/main/java/io/buildpacks/example/sample/SampleApplication.java /usr/app/
# WORKDIR /usr/app

# ENTRYPOINT ["java", "SampleApplication.java"]

#Use an official Maven image as a build environment
# FROM maven:3.8.6-openjdk-11-slim AS build
 
# # Set the working directory inside the container
# WORKDIR /app
 
# # Copy the project files and directories to the container
# COPY pom.xml .
# COPY src ./src
 
# # Build the application
# RUN mvn clean install
# RUN mvn clean package
 
# Create a final image for running the application
FROM openjdk:11-jre-slim
 
# Set the working directory inside the container
WORKDIR /app
 
# Copy the JAR file from the build environment to the final image
COPY --from=build /app/target/sample-0.0.1-SNAPSHOT.jar ./app.jar
 
# Specify the command to run on container startup
CMD ["java", "-jar", "app.jar"]