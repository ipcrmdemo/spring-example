FROM openjdk

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && \
chmod 755 /usr/local/bin/dumb-init

MAINTAINER Atomist <docker@atomist.com>

RUN mkdir -p /opt/app

WORKDIR /opt/app

EXPOSE 8080

CMD ["-jar", "spring-example-0.1.3-SNAPSHOT.jar"]

ENTRYPOINT ["/usr/local/bin/dumb-init", "java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Xmx256m", "-Djava.security.egd=file:/dev/urandom"]
RUN curl -H 'X-JFrog-Art-Api:AKCp5bBrW2nt5cHiDoSV7GQ9u239DeUDea28hLo8ZRkSAgk6wFwtTxTDSNKWP1xPfGbRjJzc7' -o "spring-example-0.1.3-SNAPSHOT.jar" https://192.168.99.100/artifactory/libs-snaptshot-local/spring-example-0.1.3-SNAPSHOT
COPY /tmp/spring-example-0.1.3-SNAPSHOT.jar spring-example-0.1.3-SNAPSHOT.jar
