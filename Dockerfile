FROM openjdk:17
ARG JAR_FILE=build/libs/crud_backend-0.0.1-SNAPSHOT.jar app.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
# Example Dockerfile
FROM sundar429/crud-image:latest

# Ensure the directory exists inside the container
RUN mkdir -p /app/libs

# Copy files from host to container
COPY ./libs /app/libs

# Additional steps as needed
