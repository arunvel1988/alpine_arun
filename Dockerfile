  FROM alpine
  RUN apk --update add openjdk8-jre wget gnupg bash curl && rm -rf /var/cache/apk/*
  RUN adduser solr --disabled-password
  COPY --chown=solr:root solr-8.4.1.zip /opt/
  WORKDIR /opt
  RUN unzip /opt/solr-8.4.1.zip
  RUN chmod -R 777 /opt
   
  COPY init.sh /opt/solr-8.4.1
 RUN chmod +x /opt/solr-8.4.1/init.sh
  
 WORKDIR /opt/solr-8.4.1
 USER root
  
 #CMD ["bin/solr","start", "-f"]
 ENTRYPOINT ["./init.sh"]
  
