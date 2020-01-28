 //def access_key = "${env.AWS_ACCESS_KEY_ID}"
 //def secret_key = "${env.AWS_SECRET_ACCESS_KEY}"
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
           //env tfhome = tool name: 'Terraform'C:\Software\terraform_0.12.8_windows_amd64
       
        
           stage ('Terraform EC2 launch') {
              steps {
               script {
                      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                      //bat 'terraform init'
                      //bat 'terraform plan -out=plan'
                      //bat 'terraform apply plan'
                       bat 'terraform destroy -force'
                      }
                   }
                 }     
            }      
      }   
}        
