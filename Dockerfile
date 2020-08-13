FROM alpine:3.12

ENV JMETERVERSION="5.3"

RUN mkdir -p /opt && mkdir -p /opt/jmeter && mkdir -p /opt/jmxfolder && cd /opt/jmeter && \
    apk --update --no-cache add wget openjdk8&& \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETERVERSION.tgz && \
    tar zxvf apache-jmeter-$JMETERVERSION.tgz && \
    apk del wget && \
    rm -f apache-jmeter-$JMETERVERSION.tgz 

RUN addgroup -S jmetergroup && adduser -S jmeteruser -G jmetergroup && \
    chown -R jmeteruser:jmetergroup /opt



USER jmeteruser

ENTRYPOINT ["tail", "-f", "/dev/null"]

