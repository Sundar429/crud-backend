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
COPY --from=build /home/gradle/src/build/libs/*.jar /app/crud_backend-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "/app/crud_backend-0.0.1-SNAPSHOT.jar"]
