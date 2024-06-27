FROM openjdk:17
ARG JAR_FILE=build/libs/crud_backend-0.0.1-SNAPSHOT.jar crud_backend.jar
COPY ${JAR_FILE} crud_backend.jar
ENTRYPOINT ["java","-jar","/crud_backend.jar"]
