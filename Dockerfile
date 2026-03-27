# Giai đoạn 1: Build ứng dụng (Sử dụng Maven và JDK 25)
FROM maven:3.9.9-eclipse-temurin-21 AS build
# Lưu ý: Hiện tại Maven image hỗ trợ ổn định nhất là temurin-21,
# nó vẫn build được code Java 25 nếu bạn cấu hình đúng trong pom.xml
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Giai đoạn 2: Chạy ứng dụng (Chỉ cần JRE nhẹ)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Copy file .jar từ giai đoạn build sang
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]