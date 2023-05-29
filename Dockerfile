FROM bitnami/kafka:3.4.0

USER root
WORKDIR /opt/bitnami/kafka/connect

ARG DEBEZIUM_VERSION

RUN mkdir plugins
RUN curl \
    https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/$DEBEZIUM_VERSION/debezium-connector-postgres-$DEBEZIUM_VERSION-plugin.tar.gz \
    --output debezium-connector-postgres-$DEBEZIUM_VERSION-plugin.tar.gz
RUN tar -xf debezium-connector-postgres-$DEBEZIUM_VERSION-plugin.tar.gz -C plugins
RUN rm debezium-connector-postgres-$DEBEZIUM_VERSION-plugin.tar.gz

COPY docker-entrypoint.sh /opt/bitnami/kafka/connect
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ./docker-entrypoint.sh
