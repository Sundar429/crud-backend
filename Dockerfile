# Dockerfile
# Stage 1: Build the application
#
#
FROM openjdk:17 AS build
WORKDIR /app
COPY . .
# RUN ./gradlew build

# Stage 2: Create the runtime image
FROM docker.io/sundar429/crud-image:latest
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
