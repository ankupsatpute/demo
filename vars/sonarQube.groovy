def sonarQube(String projectKey, String url, String login){
   sh "mvn sonar:sonar \
   -Dsonar.projectKey=${projectKey} \
   -Dsonar.host.url=${url} \
   -Dsonar.login=${login}"
}
