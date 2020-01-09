pipeline {
    options {
         skipDefaultCheckout(true)
      }
    agent any
     tools {
               maven 'Maven'
               jdk 'default'
           }
   
    stages {
          stage ('Checkout Stage') {
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
          stage ('Test Stage') {
              steps {
                       bat 'mvn test'
                }
            }
         /* stage ('Artifactory upload'){
                steps{
                  script {
                    def server = Artifactory.server('art-1')
                    def buildInfo = Artifactory.newBuildInfo()
                    buildInfo.env.capture = true  
                    buildInfo.env.collect()
                    def rtMaven = Artifactory.newMavenBuild()
                    rtMaven.tool = 'Maven'
                    rtMaven.opts = "-Denv=dev"   
                    //rtMaven.resolver server: server, releaseRepo: 'devops-quick-course', snapshotRepo: 'devops-quick-course'
                    rtMaven.deployer releaseRepo: 'devops-quick-course-snapshots', snapshotRepo: 'devops-quick-course-snapshots' , server: server
                    
                    rtMaven.run pom: 'pom.xml', goals: 'clean install', buildInfo: buildInfo
                     server.publishBuildInfo buildInfo
                   }
               }
             }
           stage ('Deploy Tomcat') {
              steps {
                //bat 'curl -T "webapp.war" "http://tomcat:tomcat@localhost:9090/manager/deploy?path=/webapp" '
                 // bat 'copy C:\\Project\\devops_quick_course\\.war C:\\Software\\apache-tomcat-9.0.30-windows-x64\\apache-tomcat-9.0.30\\webapps\\'
                  bat 'copy "C:\\Program Files (x86)\\Jenkins\\workspace\\devops-quick-course-Jenkinsfile\\webapp\\target\\*.war" C:\\Software\\apache-tomcat-9.0.30-windows-x64\\apache-tomcat-9.0.30\\webapps\\'
               }
            }*/       
                stage ('Build Docker Image') {
                    steps {
                       bat 'docker build -t webapp:webapp "C:\\Program Files (x86)\\Jenkins\\workspace\\devops-quick-course-dockerfile-day4" '
                    }
              }
              /*  stage ('Run Docker Container') {
                    steps {
                      bat 'docker run -it -d -p 9091:8080 webapp:webapp'
                } 
            }   */
        stage ('Docker ECR push') {
            steps {
                script {
                        docker.withRegistry("https://295308319646.dkr.ecr.ap-south-1.amazonaws.com", "ecr:ap-south-1:ecr_credential") {
                        docker.image("webapp:webapp").push()
                     }
                  } 
              }
        }
            //env tfhome = tool name: 'Terraform'C:\Software\terraform_0.12.8_windows_amd64
            stage ('Terraform EC2 launch') {
                steps {
                    bat 'cd C:\Software\terraform_0.12.8_windows_amd64\'
                    bat 'terraform init'
                    bat 'terraform apply'
                }     
            }               
       }
}
