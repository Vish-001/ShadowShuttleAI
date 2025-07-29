FROM eclipse-temurin:21-jdk-alpine

# 1. Copy only POM file first (for dependency caching)
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

# 2. Copy source code and build
COPY src ./src
RUN mvn package -DskipTests

# 3. Run the application
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
