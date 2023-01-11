pipeline {
    agent any
    environment {
    PATH = "/opt/apache-maven-3.8.7/bin:$PATH" 
    def junit = '**/target/surefire-reports/TEST-*.xml'
    /*def CRDID = 'Nexus'
    def NXURL = '3.108.218.88:8081'
    def NXVRN = 'nexus3'
    def PROTO = 'http'
    def REPO  = 'Sample-app'*/
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
              git branch: '$BRANCH_NAME', changelog: false, poll: false, url: 'https://github.com/ankupsatpute/simple-app-final.git'
               echo "Git Checkout Completed"
               
                 
               }
            }
        
       stage('Unit Test'){
                steps{
                    sh 'mvn test'
                }
            }
        
         stage('Maven Build'){
               steps{
                    sh 'mvn clean package'
                }  
            }
        
        stage('Check Code Coverage'){
             steps{
                    junit "${env.junit}"
                    echo 'The Junit is Sucessfull'
                    jacoco ()
                    echo 'The Code Coverage is Sucessfull'
                  echo '$WORKSPACE
                 }
            }
        
          /*stage('Code Analysis With SonarQube'){
               steps{
                withSonarQubeEnv('sonarqube-8.9.10.61524'){
                    sh'mvn sonar:sonar -Dsonar.projectKey=Ansible'
                    
                }
               }
            }*/
        
         /*stage ('Deploy_Develop'){
                when {
                    branch 'develop'
                }
            steps{
                sshagent(['Tomcat']) {
                sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/multibranch_develop/target/*.war ec2-user@172.31.7.56:/opt/apache-tomcat-9.0.70/webapps"
                     }
                   }
                }*/
        
            /*stage('Upload the Artifact'){
                when{
                    branch "release"
                }
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
              }
        
        stage ('Deploy_Release'){
              when {
                  branch 'release'
                }
            steps{
                sshagent(['Tomcat']) {
                sh "scp -o StrictHostkeyChecking=no  /var/lib/jenkins/workspace/multibranch_release/target/*.war ec2-user@172.31.11.146:/opt/apache-tomcat-9.0.70/webapps"
               }
            }
        }*/
           
   }
}
