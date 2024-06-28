# Stage 1: Build the application
FROM gradle:jdk17 as build
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2: Run the application
FROM openjdk:17
COPY --from=build /app/build/libs/crud_backend-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
