# Pull base centos image and install tomcat on it
FROM centos

MAINTAINER Naval K Joshi

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar -xvzf apache-tomcat-9.0.30.tar.gz
RUN mv apache-tomcat-9.0.30/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L http://localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war

EXPOSE 8081

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
