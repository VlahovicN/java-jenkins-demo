FROM openjdk:17-jdk-slim
COPY target/java-demo-*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
