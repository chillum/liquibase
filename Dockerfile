FROM alpine
ADD liquibase-*-bin.tar.gz /opt/liquibase/

FROM openjdk:8-jre-alpine

RUN ["apk", "--no-cache", "add", "bash"]
RUN ln -s /opt/liquibase/liquibase /usr/local/bin/
WORKDIR /liquibase

COPY --from=0 /opt/liquibase/liquibase /opt/liquibase/
COPY --from=0 /opt/liquibase/liquibase.jar /opt/liquibase/
COPY --from=0 /opt/liquibase/lib /opt/liquibase/lib

ADD *.jar /opt/liquibase/lib/

USER nobody
