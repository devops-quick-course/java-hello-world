From ubuntu:latest
MAINTAINER Naval K Joshi

RUN apt-get update && \
 apt-get install wget && \
 apt-get install tar
 
 RUN apt-get install -y openjdk-8-jdk
 
 CMD ["/bin/bash"]
