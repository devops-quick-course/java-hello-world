node {
stage ('Checkout') {
git 'https://github.com/devops-quick-course/java-hello-world'
}
stage('Build') {
sh 'mvn clean install package'
}
}
