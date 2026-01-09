FROM eclipse-temurin:17-jdk
WORKDIR /app3rd
COPY target/app3rd.jar app3rd.jar
EXPOSE 8093
ENTRYPOINT ["java","-jar","app3rd.jar"]
