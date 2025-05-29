# Step 1: Build WAR với Maven
FROM maven:3.8.8-openjdk-8 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Step 2: Chạy app với Tomcat
FROM tomcat:9.0-jdk8-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/demo-menu.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

