FROM openjdk
ARG JAR_FILE=/target/staffMember-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
