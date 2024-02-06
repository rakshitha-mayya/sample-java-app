FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./build/java-app/sample-0.0.1-SNAPSHOT.jar.original.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "sample-0.0.1-SNAPSHOT.jar.original.jar"]