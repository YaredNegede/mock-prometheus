# Use an official Java 22 runtime as a parent image
FROM openjdk:22-jdk-slim AS build

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . /app

# Build the Spring Boot application (this will generate the JAR in the target folder)
RUN mvn clean install -DskipTests

# Use a new image to run the application
FROM openjdk:22-jdk-slim

# Copy the generated JAR file from the build stage
COPY --from=build /app/target/*.jar /app.jar

# Run the JAR file
CMD ["java", "-jar", "/app.jar"]