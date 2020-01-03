# Pull base centos image and install tomcat on it
FROM centos

MAINTAINER Naval K Joshi
# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
RUN yum -y install sudo
 
######## JDK7
 
#Note that ADD uncompresses this tarball automatically
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/13.0.1+9/cec27d702aa74d5a8630c65ae61e4305/jdk-13.0.1_linux-x64_bin.tar.gz"
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz

ADD jdk-13.0.1_linux-x64_bin.tar.gz /opt
WORKDIR /opt/jdk-13.0.1
RUN alternatives --install /usr/bin/java java /opt/jdk-13.0.1/bin/java 1
RUN alternatives --install /usr/bin/jar jar /opt/jdk-13.0.1/bin/jar 1
RUN alternatives --install /usr/bin/javac javac /opt/jdk-13.0.1/bin/javac 1
RUN echo "JAVA_HOME=/opt/jdk-13.0.1" >> /etc/environment
 
######## TOMCAT
 
#Note that ADD uncompresses this tarball automatically
ADD apache-tomcat-9.0.30.tar.gz /usr/share
WORKDIR /usr/share/
RUN mv  apache-tomcat-9.0.30 tomcat9
RUN echo "JAVA_HOME=/opt/jdk-13.0.1/" >> /etc/default/tomcat9
RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat /usr/share/tomcat9
EXPOSE 8080
#CMD ["/opt/tomcat/bin/catalina.sh", "run"]
