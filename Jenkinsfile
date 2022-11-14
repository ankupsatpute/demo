pipeline{
    agent any
    tools{
  maven 'Maven'
    }
    environment {
     DOCKER_TAG = getVersion()
}
    stages{
        stage('SCM Pull'){
            steps{
                echo "Git Checkout Started"
                git credentialsId: 'git-creds', 
                    url: 'https://github.com/styagi935/simple-app.git'
                echo "Git Checkout Completed"
            }
        }
        stage('Maven Build'){
            steps{
                echo "Maven Build Started"
                sh "mvn clean package"
                echo "Maven Build is successful"
            }
        }
         stage('Unit Test') { 
            steps {
                 sh 'mvn test'
                 echo 'The Unit test is Sucessfull'
            }
        }
        stage('Code Coverage') { 
            steps {
                   jacoco exclusionPattern: '**/*Test*.class', inclusionPattern: '**/*.class', sourceExclusionPattern: 'generated/**/*.java'
                 echo 'The Code Coverage is Sucessfull'
            }
        }
 //       stage('SonarQube Analysis') {
   //         steps{
     //           echo "Sonarqube code analysis started"
       //         withSonarQubeEnv('Sonarqube-8.9.9') { 
         //       sh "mvn sonar:sonar"
           //     echo "Sonarqube code analysis started"
             //  }
           //}
        //}
        stage('Docker Build'){
            steps{
                echo "DockerBuild Started"
                sh "docker build . -t styagi935/simple-app-7.0.0:${DOCKER_TAG}"
                echo "DockerBuild Completed"
            }
        }
        stage('Docker Image Push'){
            steps{
                echo "Docker image push to dockerhub started"
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]){
                sh "docker login -u styagi935 -p ${dockerHubPwd}"
                sh "docker push styagi935/simple-app-7.0.0:${DOCKER_TAG}"
                echo "Docker image has been pushed to dockerhub "
                }
            }
        }
 /*       stage('Docker Deploy'){
            steps{
              ansiblePlaybook credentialsId: 'Ans_EC2', disableHostKeyChecking: true,extras: "-e DOCKER_TAG=${DOCKER_TAG}", installation: 'Ansible_Server', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            }
        } */
        stage("Upload Artifactory"){
            steps{
                script{
                  def mavenPom = readMavenPom file: 'pom.xml'
      //            def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "my-artifacts" : "helloworld-release"
                   nexusArtifactUploader artifacts: [
                     [
                        artifactId: "${mavenPom.artifactId}", 
                        groupId: "${mavenPom.groupId}",
                        classifier: '', 
                        file: "target/simple-app-${mavenPom.version}.war", 
                        type: 'war'
                        ]
                    ], 
                        credentialsId: 'nexus3', 
                        groupId: "${mavenPom.groupId}", 
                        nexusUrl: '3.109.5.157:8081/', 
                        nexusVersion: 'nexus3', 
                        protocol: 'http', 
                        repository: 'my-artifacts', 
                        version: "${mavenPom.version}"
                    echo "Artifacts has been uploaded to Nexus"
                }
            }
        }
        stage('Ansible playbook Pull') {
            agent {
                label 'ans'
            }
            steps {
                 git branch: 'main', url: 'https://github.com/styagi935/ansiblerepo.git'
                 echo 'The Ansible Code is Pulled Sucessfully'
            }
        }
        stage('Artifactory Pull on ansible') {
            agent {
                label 'ans'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexus3', passwordVariable: 'typas', usernameVariable: 'tyuser')]) {
                sh 'wget --user=$tyuser --password=$typas "http://3.109.5.157:8081/repository/my-artifacts/in/javahome/simple-app/7.0.0/simple-app-7.0.0.war"'
                 echo 'The Artifact is Pulled Sucessfully'
                }
            }
        }
        stage('Ansible Tomcat Deployment') {
            agent {
                label 'ans'
            }
            steps {
               ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts', playbook: 'pb3.yaml'
               echo 'Tomcat Deployment is done'
            }
        }
        stage('Pull deployment file') {
            agent {
                label 'K8'
            }
        steps {
            git branch: 'main', url: 'https://github.com/styagi935/kuberrepo.git'
            }
        }
        stage('Deploy to EKS'){
            agent{
                label 'K8'
            }
        steps{
            script{
                sh "kubectl get pods"
                sh "kubectl get svc"
      //          sh "kubectl delete svc simple-app"
     //           sh "kubectl delete deploy simple-app"
                sh "kubectl apply -f service.yaml" 
                sh "kubectl apply -f k8.yaml"    //will run deployment file
                }
            }
        }
    }
}
def getVersion(){
    def CommitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return CommitHash
}
