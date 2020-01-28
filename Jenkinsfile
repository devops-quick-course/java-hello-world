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
                    //cd "C:\Software\terraform_0.12.8_windows_amd64\"
                    bat 'terraform init'
                    //bat 'terraform plan -out=plan'
                    //bat 'terraform apply plan'
                  bat 'terraform plan -out=plan -var "access_key=$aws_key"' 
                 }     
            }      
      }   
}
