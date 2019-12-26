node {
stage ('Checkout') {
git 'https://github.com/devops-quick-course/java-hello-world'
}
stage('Build') {
bat 'mvn clean install package'
}
}
