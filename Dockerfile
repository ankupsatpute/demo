FROM tomcat:8
# Take the war and copy to webapps of tomcat
RUN rm -rf target/simple-app.war
RUN target/*.war target/simple-app.war
COPY target/*.war /usr/local/tomcat/webapps/
#CMD [ "/usr/local/tomcat/catalina.sh", "start" ]
