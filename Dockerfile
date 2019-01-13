FROM openjdk:8-jre-alpine

RUN ["apk", "--no-cache", "add", "bash"]
ADD liquibase-*-bin.tar.gz /opt/liquibase/
ADD *.jar /opt/liquibase/lib/
RUN ln -s /opt/liquibase/liquibase /usr/local/bin/

WORKDIR /liquibase
USER nobody
