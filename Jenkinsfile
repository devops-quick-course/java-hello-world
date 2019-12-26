pipeline {
    agent any
    tools {
        maven 'mavenHome'
        jdk 'JavaHome'
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
                bat ' mvn -f https://github.com/devops-quick-course/java-hello-world/pom.xml clean install'  
            }
            post {
                success {
                    echo 'Now Archiving'
                }
            }
        }
    }
}