#attempt1
#FROM debian:11-slim
#RUN apt update
#RUN apt install git -y
#RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
#WORKDIR boxfuse-sample-java-war-hello
#RUN apt install maven -y
#RUN mvn package
#RUN apt install tomcat9 -y
#RUN mv /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
#EXPOSE 8080


#attempt2
FROM maven:3.5 as build
COPY ./boxfuse-sample-java-war-hello /app/data
WORKDIR /app/data
RUN mvn clean package
FROM tomcat:jre11
COPY --from=build /app/data/target/*.war /usr/local/tomcat/webapps  
EXPOSE 8080 
RUN ls /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
