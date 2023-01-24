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
        
       
        
       stage('Git CheckOut'){
            steps{
              git branch: '$BRANCH_NAME', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/demo.git'
               echo "Git Checkout Completed"            
               }
            }
        stage('Git CheckOut'){
            when {
                branch "PR-*"
            }
            steps{
              git branch: '$BRANCH_NAME', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/demo.git'
               echo "Git Checkout Completed"            
               }
            }

      stage('Build Code'){
             steps{
                sh"mvn package"
               }
           }
        
        stage('Build Code'){
            when {
                branch "PR-*"
            }
             steps{
                sh"mvn package"
               }
           }
        
          stage('PR'){
              when {
                  branch "PR-*"
              }
              steps{
                
                  echo "This Stage Run Only Pull Request"
                
              }
          }
 
     /* stage('Code Coverage'){
            steps{
               script{
              // codeCoverage.codeCoverage()
               jacoco()
                  }
                }
             }*/
       /* stage('SonarQube'){
            steps{
                script{
                    sonarQube.sonarQube('Ansible','http://65.1.100.239:9000','7437925915ba82d0b5f6a5f736f43aac5f412bed')
                }
            }
        }*/
        
        /*stage('Upload the Artifact'){
            steps{
                script{
                  def mavenPom = readMavenPom file: 'pom.xml'
                  
                    nexusArtifactUploader artifacts:[
                     [artifactId: "${mavenPom.artifactId}",
                     classifier: '', 
                     file: "target/${mavenPom.artifactId}-${mavenPom.version}.${mavenPom.packaging}",
                     type: "${mavenPom.packaging}"]
                     ],
                     credentialsId: "${env.CRDID}",
                     groupId: "${mavenPom.groupId}",
                     nexusUrl: "${env.NXURL}",
                     nexusVersion: "${env.NXVRN}", 
                     protocol: "${env.PROTO}", 
                     repository: "${env.REPO}", 
                     version: "${mavenPom.version}"
                 }
            }
        }*/
        
    /* stage('Deploy'){
          steps{
              sshagent(['Tomcat']) {
                 script{
                   deploy.deploy()
                   }
                }
             }
           }*/

    }
}
