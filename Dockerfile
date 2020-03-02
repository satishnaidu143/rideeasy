FROM tomcat:8
ADD /home/ubuntu/ride.war /usr/local/tomcat/webapps
EXPOSE 8080
MAINTAINER "satish"          