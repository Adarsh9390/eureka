# Use an official OpenJDK image as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/*.jar eureka-server.jar

# Expose Eureka server port
EXPOSE 8761

# Run the Eureka server
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]
