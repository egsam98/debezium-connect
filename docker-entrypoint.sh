#!/bin/sh

export CONFIG=connect.properties
touch $CONFIG
echo "bootstrap.servers=$BOOTSTRAP_SERVERS" >> $CONFIG && \
  echo "offset.storage.topic=connect-offset" >> $CONFIG && \
  echo "config.storage.topic=connect-config" >> $CONFIG && \
  echo "status.storage.topic=connect-status" >> $CONFIG && \
  echo "group.id=$GROUP_ID" >> $CONFIG && \
  echo "key.converter=org.apache.kafka.connect.json.JsonConverter" >> $CONFIG && \
  echo "value.converter=org.apache.kafka.connect.json.JsonConverter" >> $CONFIG && \
  echo "plugin.path=$PLUGIN_PATH" >> $CONFIG

/opt/bitnami/kafka/bin/connect-distributed.sh $CONFIG
