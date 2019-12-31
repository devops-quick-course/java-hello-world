# Pull base centos image and install tomcat on it
FROM centos

MAINTAINER Naval K Joshi
# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30-deployer.tar.gz
RUN tar -xvzf apache-tomcat-9.0.30-deployer.tar.gz
RUN mv apache-tomcat-9.0.30-deployer/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
#RUN wget -O /opt/tomcat/webapps/webapp.war http://localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
#RUN curl -k -u admin:password "http://docker.for.windows.localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war"
RUN wget --user=admin --password=password --network="localhost" "http://localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war"
EXPOSE 8081
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
