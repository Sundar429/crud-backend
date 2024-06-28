FROM gradle:jdk17
WORKDIR /app
COPY . .
CMD /bin/sh


# Stage 2: Create the runtime image
FROM openjdk:17
COPY --from=build /build/libs/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
