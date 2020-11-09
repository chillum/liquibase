FROM alpine
ADD liquibase-*.tar.gz /opt/liquibase/

FROM openjdk:11-jre-slim

RUN ln -s /opt/liquibase/liquibase /usr/local/bin/
WORKDIR /liquibase

COPY --from=0 /opt/liquibase/liquibase /opt/liquibase/
COPY --from=0 /opt/liquibase/liquibase.jar /opt/liquibase/
COPY --from=0 /opt/liquibase/lib /opt/liquibase/lib

ADD *.jar /opt/liquibase/lib/

USER nobody
