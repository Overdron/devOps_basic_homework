#FROM openjdk:8u151-stretch
FROM tomcat:jre11

VOLUME /var/run/docker.sock:/var/run/docker.sock
ADD target/*war /usr/local/tomcat/webapps 
EXPOSE 8080 