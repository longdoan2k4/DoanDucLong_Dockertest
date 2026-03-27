FROM bellsoft/liberica-openjdk-alpine:25 AS build
WORKDIR /app
COPY . .
# Cấp quyền chạy cho file mvnw (tránh lỗi permission denied)
RUN chmod +x mvnw
# Build file jar
RUN ./mvnw clean package -DskipTests

# Giai đoạn 2: Chạy ứng dụng
FROM bellsoft/liberica-openjdk-alpine:25
WORKDIR /app
# Lấy file jar đã build từ giai đoạn 1 sang
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
