FROM ubuntu:latest as builder
WORKDIR /root/src
RUN apt update && apt -y upgrade && apt -y install git openjdk-8-jdk maven
RUN git clone https://github.com/contrast-community/spring-petclinic
WORKDIR /root/src/spring-petclinic
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
# No need to set javac
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN mvn package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /root/src/spring-petclinic/target/spring-petclinic-\*.jar ./spring-petclinic.jar

# Example of how to download the java agent automatically each time.
#ARG CONTRAST_URL=https://app.contrastsecurity.com
#ARG ORG_ID
#ARG AUTH_TOKEN
#ARG API_KEY
#RUN curl -X GET $CONTRAST_URL/Contrast/api/ng/$ORG_ID/agents/default/JAVA -o /app/contrast.jar -H 'Authorization: $AUTH_TOKEN' -H 'API-Key: $API_KEY' -H 'Accept: application/json' -OJ

CMD java -javaagent:contrast.jar -jar spring-petclinic.jar
#  Below is an example of passing Contrast info via command line
#CMD java -javaagent:contrast.jar -Dcontrast.standalone.appname="PetClinic-guide" -jar spring-petclinic.jar
EXPOSE 8080
