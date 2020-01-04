# Pull base centos image and install tomcat on it
FROM centos7

MAINTAINER Naval K Joshi
# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

WORKDIR /opt/tomcat
RUN yum install tomcat-webapps tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc
#RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
#RUN tar -xvzf apache-tomcat-9.0.30.tar.gz
#RUN mv apache-tomcat-9.0.30/* /opt/tomcat/
#RUN yum -y install java
#RUN java -version

WORKDIR /opt/tomcat/webapps

#RUN wget -o /opt/tomcat/webapps/webapp.war http://192.168.217.1:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
#RUN curl -k -u admin:password "http://docker.for.windows.localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war"
#RUN wget --user=admin --password=password --network="localhost" "http://localhost:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war"
#RUN chmod +x /opt/tomcat/webapps/webapp.war
#RUN chmod +x /opt/tomcat/bin/catalina.sh
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
