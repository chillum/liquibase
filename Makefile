LB_VER = 3.5.5
LB_TAR = liquibase-${LB_VER}-bin.tar.gz
JDBC_VER = 42.2.5
JDBC = postgresql-${JDBC_VER}.jar

download: ${LB_TAR} ${JDBC}

clean:
	rm -f *.jar *.tar.gz

docker:
	docker build -t chillum/liquibase .

${LB_TAR}:
	wget https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${LB_VER}/${LB_TAR}

${JDBC}:
	wget https://jdbc.postgresql.org/download/${JDBC}
