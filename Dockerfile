FROM openjdk:17
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} crud_backend-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/crud_backend-0.0.1-SNAPSHOT.jar"]