FROM ubuntu:18.04

RUN apt-get update && apt-get install -y maven

RUN git clone https://github.com/ngthvan1612/SocialMediaBackend && \
    cd SocialMediaBackend && \
    mvn clean install

