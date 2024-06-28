# Dockerfile
# Stage 1: Build the application
#
FROM openjdk:17 AS build
WORKDIR /app
COPY . .
# RUN ./gradlew build

# Stage 2: Create the runtime image
FROM docker.io/sundar429/crud-image:latest
# Check the following line
COPY ./crud_backend/build/libs /app/libs
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
