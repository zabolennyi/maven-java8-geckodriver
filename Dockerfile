FROM ubuntu

#Install maven, firefox and JAVA8
RUN apt update && apt install \
        firefox \
        wget \
        maven \
        xvfb   \
        software-properties-common \
        openjdk-8-jdk -y
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

#Install GeckoDriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz -O geckodriver.tar.gz
RUN tar xzvf geckodriver.tar.gz
RUN rm geckodriver.tar.gz

RUN mv geckodriver /usr/bin/geckodriver

ENV DISPLAY localhost:20 
RUN wXvfb :20 -screen 0 1366x768x16 &
