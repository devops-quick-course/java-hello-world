FROM ubuntu
#Install Lynx
Run apt-get update
Run apt-get install -y lynx

#Install Curl
Run apt-get install -y curl

#Install tools: jdk
Run apt-get update
Run apt-get install -y openjdk-8-jdk wget

#Install apache tomcat
Run groupadd tomcat
Run useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
Run cd /tmp
Run curl -O http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz
Run mkdir /opt/tomcat
Run tar -xzvf apache-tomcat-8.5.50.tar.gz -C /opt/tomcat --strip-components=1
Run cd /opt/tomcat
Run chgrp -R tomcat /opt/tomcat
Run chmod -R g+r /opt/tomcat/conf
Run chmod g+x /opt/tomcat/conf
Run chown -R tomcat /opt/tomcat/webapps /opt/tomcat/work /opt/tomcat/temp opt/tomcat/logs

#ENV JAVA_OPTS="-XX:PermSize=1024m -XX:MaxPermSize=512m"

Run cd /opt/tomcat/webapps

#RUN wget -o /opt/tomcat/webapps/webapp.war http://172.24.65.209:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
#RUN cd /opt/tomcat/webapps;wget http://172.24.65.209:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
#RUN cd /opt/tomcat/webapps;wget http://172.24.65.209:8040/artifactory/devops-quick-course-snapshots/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
#RUN mv  /opt/tomcat/webapps/webapp-1.0-SNAPSHOT.war /opt/tomcat/webapps/webapp.war; chmod 755 /opt/tomcat/webapps/webapp.war 
# copy application code from local webapp-1.0-SNAPSHOT to container 
 COPY C:\Software\Jenkins\workspace\AWS_Infra_Launch\webapp\target\webapp.war  /opt/tomcat/webapps/ 

Expose 9090

#CMD /opt/tomcat/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out

CMD /opt/tomcat/bin/catalina.sh run

