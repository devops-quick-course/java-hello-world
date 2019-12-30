# Pull base centos image and install tomcat on it
FROM centos:centos7
MAINTAINER Naval K Joshi

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

# Prepare environment variables
ENV JAVA_HOME /usr/java/latest
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

RUN yum install -y \
   java-1.8.0-openjdk \
   java-1.8.0-openjdk-devel

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/

# Install Oracle Java8
#ENV JAVA_VERSION 12.0.2
#ENV JAVA_BUILD 12.0.2+10
#ENV JAVA_DL_HASH e482c34c86bd4bf8b56c0b35558996b9

#RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
# https://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_DL_HASH}/jdk-${JAVA_VERSION}_linux-x64_bin.rpm && \
# yum -y localinstall jdk*


# Install Tomcat
ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.30

# RUN http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30-deployer.tar.gz
#RUN tar -xvf apache-tomcat-9.0.30-deployer.tar.gz
 #rm apache-tomcat*.tar.gz && \
#RUN mv apache-tomcat* ${CATALINA_HOME}

#RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Create Tomcat admin user
#ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
#ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
#RUN chmod +x $CATALINA_HOME/scripts/*.sh

# Create tomcat user
#RUN groupadd -r tomcat && \
 #useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
 #chown -R tomcat:tomcat ${CATALINA_HOME}

#WORKDIR /opt/tomcat

#EXPOSE 9091

#USER tomcat
#CMD ["tomcat.sh"] *#

RUN cd /opt
RUN wget  http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar -xvzf apache-tomcat-9.0.30.tar.gz
 #rm apache-tomcat*.tar.gz && \
#RUN mkdir /opt/tomcat
#RUN mv apache-tomcat* ${CATALINA_HOME}

RUN chmod +x ./apache-tomcat-9.0.30/bin/*sh

# Create Tomcat admin user
#ADD create_admin_user.sh /opt/apache-tomcat-9.0.30/scripts/create_admin_user.sh
#ADD tomcat.sh /opt/apache-tomcat-9.0.30/scripts/tomcat.sh
#RUN chmod +x /opt/apache-tomcat-9.0.30/scripts/*.sh

# Create tomcat user
RUN groupadd -r tomcat && \
 useradd -g tomcat -d /opt/apache-tomcat-9.0.30 -s /sbin/nologin  -c "Tomcat user" tomcat && \
 chown -R tomcat:tomcat /opt/apache-tomcat-9.0.30

WORKDIR /opt/apache-tomcat-9.0.30

EXPOSE 9091

USER tomcat
CMD ["tomcat.sh"]
