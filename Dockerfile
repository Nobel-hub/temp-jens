FROM tomcat:10.1.46-jdk21-temurin-noble

RUN mkdir -p /opt/jmx

COPY jmx_prometheus_javaagent-0.20.0.jar /opt/jmx/jmx_prometheus_javaagent.jar
COPY config.yml /opt/jmx/config.yml

COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
EXPOSE 9404

ENV CATALINA_OPTS="-javaagent:/opt/jmx/jmx_prometheus_javaagent.jar=9404:/opt/jmx/config.yml"

CMD ["catalina.sh", "run"]
