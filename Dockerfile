FROM jboss/wildfly

RUN /opt/jboss/wildfly/bin/add-user.sh -a -u 'quickstartUser' -p 'quickstartPwd1!' -g 'guest' --silent
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent

ADD master.customization /opt/jboss/wildfly/customization/
RUN /opt/jboss/wildfly/customization/execute.sh standalone standalone-full.xml

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-full.xml"]
