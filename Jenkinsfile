pipeline {
    agent any
       tools {
               maven 'Maven'
               jdk 'default'
              }
    stages {
          stage ('Checkout') {
              steps {
                           git 'https://github.com/devops-quick-course/java-hello-world'
                    }
              }
          stage('Build') {
              steps {
                     echo 'maven clean'
                    //ABC indicates the folder name where the pom.xml file resides
                     bat ' mvn -f pom.xml clean install'  
                 }
            }
            /*post {
                success {
                    echo 'Now Archiving'
                }
            }*/
         stage ('Test') {
              steps {
                       bat 'mvn test'
                    }
              }
            stage ('Artifactory Deploy'){
                steps{
                  script {
                     def server = Artifactory.server('art-1')
                     def rtMaven = Artifactory.newMavenBuild()
                    //rtMaven.resolver server: server, releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot'
                    rtMaven.deployer server: server, releaseRepo: 'devops-quick-course-snapshots', snapshotRepo: 'devops-quick-course-snapshots'
                    rtMaven.tool = 'Maven'
                    def buildInfo = rtMaven.run pom: 'pom.xml', goals: 'clean install'
                     server.publishBuildInfo buildInfo
                   }
               }
             }
            stage ('Deploy Tomcat') {
              steps {
                //bat 'curl -T "webapp.war" "http://tomcat:tomcat@localhost:9090/manager/deploy?path=/webapp" '
                  bat '''copy C:\\Program Files (x86)\\Jenkins\\workspace\\devops-quick-course-Jenkinsfile\\webapp\\target\\*.war C:\\Software\\apache-tomcat-9.0.30-windows-x64\\apache-tomcat-9.0.30\\webapps\\'''
            }
        }
    }     
}
