#!/bin/bash

set -e -u

rm -rf kafka-connect-jdbc
mkdir kafka-connect-jdbc

confluent-hub install confluentinc/kafka-connect-jdbc:latest \
  --component-dir kafka-connect-jdbc \
  --no-prompt
