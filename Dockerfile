FROM tomcat:8
ADD /var/lib/jenkins/webapp.war /usr/local/tomcat/webapps
EXPOSE 8080
MAINTAINER "satish"          