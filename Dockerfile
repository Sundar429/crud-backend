# Stage 1: Build the application
FROM mcr.microsoft.com/windows/servercore:ltsc2022 as build
WORKDIR /app

# Copy Gradle build files
COPY build.gradle settings.gradle /app/

# Use PowerShell to list files for debugging
RUN powershell -Command "Get-ChildItem -Force"

# Copy the rest of the application code
COPY . .

# Run Gradle build
RUN powershell -Command "gradle build"

# Verify if the build/libs directory and JAR file exist
RUN powershell -Command "Get-ChildItem -Force build/libs"

# Stage 2: Create the runtime image
FROM mcr.microsoft.com/windows/servercore:ltsc2022
COPY --from=build /app/build/libs/*.jar /app/app.jar
ENTRYPOINT ["powershell", "-Command", "java -jar /app/app.jar"]
