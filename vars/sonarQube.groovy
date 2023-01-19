def sonarQube(Map config = [:]){
     sh"mvn sonar:sonar \
     -Dsonar.projectKey=${config.projectKey} \
     -Dsonar.host.url=${config.host.url} \
     -Dsonar.login=${config.login}"
}
