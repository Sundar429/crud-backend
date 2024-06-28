# Stage 1: Build the application
FROM gradle:jdk17 as build
WORKDIR /app

# Copy the Gradle build files first to leverage caching
# COPY build.gradle settings.gradle /app/

# # Check if these files exist to debug
# RUN ls -al /app/

# # Download dependencies only
# RUN gradle --no-daemon dependencies

# # Copy the rest of the application code
# COPY . .

# # Build the application
# RUN gradle --no-daemon build

# Stage 2: Create the runtime image
FROM openjdk:17
COPY --from=build /app/build/libs/crud_backend-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
