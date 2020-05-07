
ARG CONNECT_VERSION="5.5.0"
FROM confluentinc/cp-kafka-connect:${CONNECT_VERSION}

## Debezium version
ARG DEBEZIUM_VERSION="1.1.1.Final"
ARG PLUGINS_PATH="/usr/share/java"

RUN mkdir -p ${PLUGINS_PATH}

## PostreSQL
RUN curl -L "https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${DEBEZIUM_VERSION}/debezium-connector-postgres-${DEBEZIUM_VERSION}-plugin.tar.gz" \
        -o /tmp/debezium-connector-postgres.tar.gz \
    && tar xvfz /tmp/debezium-connector-postgres.tar.gz -C "${PLUGINS_PATH}" \
    && rm /tmp/debezium-connector-postgres.tar.gz

## SQL Server
RUN curl -L "https://repo1.maven.org/maven2/io/debezium/debezium-connector-sqlserver/${DEBEZIUM_VERSION}/debezium-connector-sqlserver-${DEBEZIUM_VERSION}-plugin.tar.gz" \
        -o /tmp/debezium-connector-sqlserver.tar.gz \
    && tar xvfz /tmp/debezium-connector-sqlserver.tar.gz -C "${PLUGINS_PATH}" \
    && rm /tmp/debezium-connector-sqlserver.tar.gz

