FROM ubuntu:latest
LABEL authors="longdoan"
WORKDIR /app

# Copy file .jar (sau khi build) vào trong Docker
COPY target/*.jar app.jar

# Mở cổng 8080 (cổng mặc định của Spring Boot)
EXPOSE 8080

# Lệnh chạy ứng dụng khi Docker khởi động
ENTRYPOINT ["java", "-jar", "app.jar"]