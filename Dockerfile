FROM ubuntu:22.04

RUN apt-get update && apt-get install -y maven git openjdk-17-jdk

WORKDIR /app

RUN git clone https://github.com/ngthvan1612/SocialMediaBackend && \
    cd SocialMediaBackend && \
    echo "spring.profiles.active=prod" > src/main/resources/application.properties && \
    mvn clean install  -DskipTests

RUN ls SocialMediaBackend/src/main/resources && cat SocialMediaBackend/src/main/resources/application.properties

RUN mkdir -p /app/deploy && cp /app/SocialMediaBackend/target/SocialMediaBackend-0.0.1-SNAPSHOT.war /app/deploy/SocialMediaBackend.war

