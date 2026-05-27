FROM maven:3.9-eclipse-temurin-17 AS build
COPY . .
RUN mvn package

FROM eclipse-temurin:17-jdk-jammy
COPY --from=build target/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]