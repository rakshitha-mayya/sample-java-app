FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY src/main/java/io/buildpacks/example/sample/SampleApplication.java /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "SampleApplication.java"]