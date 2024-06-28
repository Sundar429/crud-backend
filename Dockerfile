# Dockerfile
# Stage 1: Build the application
#
#
FROM openjdk:17 AS build


# Stage 2: Create the runtime image
FROM docker.io/sundar429/crud-image:latest
ARG JAR_FILE= crud_backend/build/libs/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","app.jar"]
