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
        
        
        stage('CheckOut'){
            steps{
                script{
               echo "Git Checkout Started"
                fetchCode.gitcheckout()
               echo "Git Checkout Completed"            
               }
            }
        }
       /* stage('CheckOut for Master'){
            when {
                branch "master"
            }
            steps{
                script{
               echo "Git Checkout Started"
                fetchCode.gitcheckout()
               echo "Git Checkout Completed"            
               }
            }
        }
        
          stage('CheckOut for develop'){
            when {
                branch "develop"
            }
            steps{
                script{
                echo "Git Checkout Started"
                fetchCode.gitcheckout1()
               echo "Git Checkout Completed"            
               }
            }
          }
        stage('CheckOut for Feature'){
            when {
                branch "feature"
            }
            steps{
                script{
               echo "Git Checkout Started"
               fetchCode.gitcheckout2()
               echo "Git Checkout Completed"            
               }
            }
        }
        stage('CheckOut for PR'){
            when {
                branch "PR-*"
            }
            steps{
               script{
               echo "Git Checkout Started"
               fetchCode.gitcheckout2()
               echo "Git Checkout Completed"            
               }
            }
        }*/
         stage('Build Code'){
             steps{
                 script{
                     buildCode.buildCode()
                 }
               }
           }
     
    }
}
