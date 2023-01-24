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
              git branch: 'master', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/demo.git'
               echo "Git Checkout Completed"            
               }
            }
        stage('CheckOut for Develop'){
            when {
                branch "develop"
            }
            steps{
              git branch: 'develop', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/demo.git'
               echo "Git Checkout Completed"            
               }
            }
        
        stage('PR'){
            when {
                branch "PR-*"
            }
            steps{
                echo "This Stage for Pull Request"
            }
        }
        
      stage('Build Code'){
             steps{
                sh"mvn package"
               }
           }
        
     
    }
}
