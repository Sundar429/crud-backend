# Dockerfile
# Stage 1: Build the application
#
#
FROM openjdk:17 AS build
COPY build/libs/crud_backend-0.0.1-SNAPSHOT.jar crud_backend-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","crud_backend-0.0.1-SNAPSHOT.jar"]
