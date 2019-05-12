## liquibase Docker container

includes driver for Postgres

size of image: around 90MB

intended usage:

```dockerfile
FROM chillum/liquibase

COPY sql.xml /liquibase/
# liquibase.properties should be like:
# url: jdbc:postgresql://...
# changeLogFile: sql.xml
COPY liquibase.properties /liquibase/

CMD  liquibase update
```
