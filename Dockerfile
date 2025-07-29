FROM eclipse-temurin:21-jdk-alpine

# Install Maven first
RUN apk add --no-cache maven

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn package -DskipTests

ENTRYPOINT ["java","-jar","target/*.jar"]
