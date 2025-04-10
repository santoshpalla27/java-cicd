FROM maven AS buildstage
RUN mkdir /opt/webpage
WORKDIR /opt/webpage
COPY . .
RUN mvn clean install 

FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/webpage/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080


FROM eclipse-temurin:17-jdk-alpine
    
WORKDIR app 
 
COPY --from=buildstage /opt/webpage/target/*.war .

EXPOSE 8080

CMD ["java", "-jar", "*.war"]
