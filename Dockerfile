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
COPY --from=build /app/build/libs/*.jar /app/app.jar

# Check the file in the final image
RUN ls -l /app

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
