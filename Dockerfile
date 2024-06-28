# Stage 1: Build the application
FROM gradle:jdk17 as build
WORKDIR /app

# Copy only necessary files for dependency resolution first to leverage caching
COPY build.gradle settings.gradle /app/

# Fetch dependencies, which will be cached if unchanged
RUN gradle --no-daemon dependencies

# Copy the rest of the application source code
COPY . .

# Build the application
RUN gradle --no-daemon build

# Stage 2: Run the application
FROM openjdk:17
COPY --from=build /app/build/libs/crud_backend-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
