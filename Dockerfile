From centos8

MAINTAINER Naval K Joshi

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
 # Install JDK
RUN yum -y install java-1.8.0-openjdk-devel
RUN java -version
   
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk"

RUN source /etc/profile.d/java.sh
RUN echo $JAVA_HOME
#RUN mkdir /opt/tomcat/
#Install Tomcat in Docker container
WORKDIR /opt/tomcat

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar -xvzf apache-tomcat-9.0.30.tar.gz
RUN mv apache-tomcat-9.0.30/* /opt/tomcat/

ENV CATALINA_HOME /opt/tomcat/
ENV PATH $CATALINA_HOME/bin:$PATH
ENV PATH $PATH:$JAVA_HOME/bin:/opt/tomcat/apache-tomcat-9.0.30/bin

#RUN yum -y install java
#RUN java -version

EXPOSE 9090
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
