#!/bin/bash

set -e
set -u

topic=inventory

kafka-topics \
   --bootstrap-server $BOOTSTRAP_SERVERS \
   --command-config client.properties \
   --delete \
   --topic $topic \
