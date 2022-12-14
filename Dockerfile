FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
#CMD [ "/usr/local/tomcat/catalina.sh", "start" ]
