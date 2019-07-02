FROM beyondspider/java:latest
MAINTAINER from www.beyondspider.com by admin (admin@beyondspider.com)

ADD https://download.beyondspider.com/docker/apache-tomcat-9.0.21.tar.gz /tmp/apache-tomcat-9.0.21.tar.gz

RUN yum -y install autossh && \
    mkdir -p /opt/tomcat && \
    tar -xzvf /tmp/apache-tomcat-9.0.21.tar.gz -C /opt/tomcat && \
    rm -rf /tmp/apache-tomcat-9.0.21.tar.gz

COPY ./conf/tomcat-users.xml /opt/tomcat/apache-tomcat-9.0.21/conf/tomcat-users.xml
#COPY ./localhost/manager.xml /opt/tomcat/apache-tomcat-9.0.21/conf/Catalina/localhost/manager.xml
COPY ./manager/context.xml /opt/tomcat/apache-tomcat-9.0.21/webapps/manager/META-INF/context.xml
COPY ./host-manager/context.xml /opt/tomcat/apache-tomcat-9.0.21/webapps/host-manager/META-INF/context.xml

ADD run.sh /run.sh
ADD tomcat.sh /tomcat.sh
ADD copy.sh /copy.sh
ADD tunnel.sh /tunnel.sh

ENV CATALINA_HOME /opt/tomcat/apache-tomcat-9.0.21
ENV PATH $CATALINA_HOME/bin:$PATH

RUN chmod 777 /*.sh && \
	chmod 777 $CATALINA_HOME/bin/*.sh && \
	echo "export $(cat /proc/1/environ |tr '\0' '\n' | xargs)" >> /etc/profile

EXPOSE 8080
CMD ["/run.sh"]
