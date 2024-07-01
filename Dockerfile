FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY build/libs/crud_backend-0.0.1-SNAPSHOT.jar /app/crud_backend.jar
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/app/crud_backend-0.0.1-SNAPSHOT.jar"]
