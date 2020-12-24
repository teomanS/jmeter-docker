FROM alpine:3.12

ENV JMETERVERSION="5.4"

RUN mkdir -p /opt && mkdir -p /opt/jmeter && mkdir -p /opt/jmxfolder && cd /opt/jmeter && \
    apk --update --no-cache add wget openjdk8&& \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETERVERSION.tgz && \
    tar zxvf apache-jmeter-$JMETERVERSION.tgz && \
    apk del wget && \
    rm -f apache-jmeter-$JMETERVERSION.tgz 

RUN adduser -S jmeteruser -g 0 && \
    chgrp -R 0 /opt && \
    chmod -R 777 /opt

USER jmeteruser
WORKDIR /opt/jmeter/apache-jmeter-$JMETERVERSION/bin

ENTRYPOINT ["tail", "-f", "/dev/null"]

