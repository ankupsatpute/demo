@Library("demo") _
pipeline{
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH"
    
     }
    
    stages{
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }
        
        stage('CheckOut for Master'){
            when {
                branch "master"
            }
            steps{
               echo "Git Checkout Started"
                fetch.gitcheckout()
               echo "Git Checkout Completed"            
               }
            }
        
          stage('CheckOut for Master'){
            when {
                branch "develop"
            }
            steps{
               echo "Git Checkout Started"
                fetch.gitcheckout1()
               echo "Git Checkout Completed"            
               }
            }
        stage('CheckOut for Master'){
            when {
                branch "feature"
            }
            steps{
               echo "Git Checkout Started"
                fetch.gitcheckout2()
               echo "Git Checkout Completed"            
               }
            }
        
        stage('CheckOut for Master'){
            when {
                branch "PR-*"
            }
            steps{
               echo "Git Checkout Started"
                fetch.gitcheckout2()
               echo "Git Checkout Completed"            
               }
            }
         stage('Build Code'){
             steps{
                sh"mvn package"
               }
           }
     
    }
}
