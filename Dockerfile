# Dockerfile
# Stage 1: Build the application
#
FROM openjdk:17 AS build
WORKDIR /app
COPY . .
RUN ./gradlew.bat

# Stage 2: Create the runtime image
FROM docker.io/sundar429/crud-image:latest
COPY --from=build /app/build/libs/*.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
