#!/bin/bash

set -e
set -u

topic=inventory

kafka-topics \
   --bootstrap-server $BOOTSTRAP_SERVERS \
   --command-config client.properties \
   --create \
   --topic $topic \
   --partitions 1 \
   --replication-factor 3
