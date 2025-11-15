# Backend code for OUSL insurance Automation System
Med@ousl
### Software Training component by YML Kumara @OUSL 2024 Under supervision of Dr.LSK Udugama

# Clone
sudo git clone https://github.com/Lakshakumara/icas_backend.git
sudo git clone https://github.com/Lakshakumara/icas-frontEnd-angular.git
rm -r icas_backend_old/ remove directory
## Database
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>

## Database migration tool
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-core</artifactId>
</dependency>

## Reporting tool

<dependency>
            <groupId>net.sf.jasperreports</groupId>
            <artifactId>jasperreports</artifactId>
            <version>6.20.6</version>
</dependency>

## Template engine
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>

\dt- Show all tables in the current schema:
\dt public.* Show tables in a specific schema (e.g., public):
\d or \d+ table_name  Show more details about each table:


to run agadmin in docker
docker run -d \
--name pgadmin \
-e PGADMIN_DEFAULT_EMAIL=lakshakumara@gmail.com \
-e PGADMIN_DEFAULT_PASSWORD=Med@ou#980 \
-p 8081:80 \
dpage/pgadmin4

