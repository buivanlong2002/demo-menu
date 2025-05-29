# Stage 1: Build WAR với Maven và JDK 8
FROM maven:3.8.7-openjdk-8 AS build

WORKDIR /app

# Copy pom.xml và source code
COPY pom.xml .
COPY src ./src

# Build dự án, bỏ qua test để nhanh hơn (nếu cần test thì bỏ -DskipTests)
RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng bằng Tomcat với JDK 8
FROM tomcat:9.0-jdk8-openjdk

# Xóa ứng dụng mặc định trong Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build từ stage trước vào Tomcat, đổi tên thành ROOT.war để truy cập mặc định
COPY --from=build /app/target/demo-menu.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng Tomcat chuẩn
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]

