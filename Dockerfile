FROM spicelabs/ginger AS ginger
FROM spicelabs/goatrodeo AS goatrodeo

ENV CLASSPATH=.;/opt/docker/lib/

#USER root
#RUN mkdir /opt/grinder
#RUN cp /opt/docker/lib/goatrodeo.goatrodeo*.jar /opt/docker/lib/goatrodeo.jar
#RUN cp /opt/docker/lib/goatrodeo.goatrodeo*.jar /opt/grinder/goatrodeo.jar

#COPY --from=goatrodeo /opt/docker/lib/goatrodeo.goatrodeo-0.6.3.jar /goatrodeo.jar
COPY --from=ginger /usr/bin/ginger /usr/bin/ginger
COPY ./grind.sh /opt/grinder/grind.sh


ENTRYPOINT ["/opt/grinder/grind.sh"]
#ENTRYPOINT ["/usr/bin/sh"]