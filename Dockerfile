# Use an official Java 22 runtime as a parent image
FROM openjdk:22-jdk-slim

# Copy the built JAR file into the container
COPY target/*.jar /app.jar

# Run the JAR file
CMD ["java", "-jar", "/app.jar"]
