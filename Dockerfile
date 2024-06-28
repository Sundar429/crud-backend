# Stage 1: Build the application
FROM gradle:jdk17 as build
WORKDIR /app

# Copy Gradle build files
COPY build.gradle settings.gradle /app/

# Download dependencies, leveraging Docker caching
RUN gradle --no-daemon dependencies

# Copy the rest of the application code
COPY . .

# Build the application
RUN gradle --no-daemon build

# Check if the build/libs directory and the JAR file exist
RUN ls -al /app/build/libs

# Stage 2: Create the runtime image
FROM openjdk:17
COPY --from=build /app/build/libs/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
