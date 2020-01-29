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
           stage ('Test Stage') {
              steps {
                       bat 'mvn test'
                }
            } 
           stage ('Build Docker Image') {
              steps {
                 script {
                       //bat 'docker build -t webapp:webapp "C:\\Program Files (x86)\\Jenkins\\workspace\\devops-quick-course-dockerfile-day4" '
                       //bat label: '', script: 'docker build -t webapp:webapp "C:\\\\Program Files (x86)\\\\Jenkins\\\\workspace\\\\devops-quick-course-dockerfile-day4'
                         // C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell label: '', script: 'docker build -t webapp:webapp .'
                        bat 'docker build -t webapp:webapp . '
                        }
                  }      
              }
       /*  stage ('Run Docker Container') {
                    steps {
                      bat 'docker run -it -d -p 9091:8080 webapp:webapp'
                    }
               } */ 
        stage ('Docker ECR push') {
            steps {
                script {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        //docker.withRegistry("https://295308319646.dkr.ecr.ap-south-1.amazonaws.com", "ecr:ap-south-1:ecr_credential") {
                        //docker.image("webapp:webapp").push()
                        docker tag webapp:webapp 295308319646.dkr.ecr.ap-south-1.amazonaws.com/webapp:webapp
                        docker push 295308319646.dkr.ecr.ap-south-1.amazonaws.com/webapp:webapp
                     }
                  } 
              }
        }
          /*  stage ('Terraform EC2 launch') {
              steps {
               script {
                      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                      bat 'terraform init' // Initialize provider 
                      bat 'terraform plan -out=plan' // Create plan before apply it 
                      bat 'terraform apply plan'
                      bat 'terraform destroy -force' // remove created infrastructure forcefully (won't ask for input yes before destroy)
                      }
                   }
                 }     
            } */     
    }   
}
