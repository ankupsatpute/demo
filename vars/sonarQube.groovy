def sonarQube(String projectKey, String url, String login){
   sh "mvn sonar:sonar \
  -Dsonar.projectKey=Ansible \
  -Dsonar.host.url=http://65.1.100.239:9000 \
  -Dsonar.login=7437925915ba82d0b5f6a5f736f43aac5f412bed"
}
