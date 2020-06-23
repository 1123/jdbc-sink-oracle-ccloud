#!/bin/bash

set -u -e 

for TEMPLATE in $(find . -name "*.template"); do
  FILE=$(echo $TEMPLATE | sed 's/.template//')
  echo "creating $FILE"
  cat $TEMPLATE |\
    sed 's;CC_API_KEY;'${CC_API_KEY}';' |\
    sed 's;CC_API_SECRET;'$CC_API_SECRET';' |\
    sed 's;SCHEMA_REGISTRY_URL;'$SCHEMA_REGISTRY_URL';' |\
    sed 's/SCHEMA_REGISTRY_KEY/'$SCHEMA_REGISTRY_KEY'/' |\
    sed 's/SCHEMA_REGISTRY_SECRET/'$SCHEMA_REGISTRY_SECRET'/' |\
    sed 's/WALLET_PASS/'$WALLET_PASS'/' |\
    sed 's/ORACLE_USER/'$ORACLE_USER'/' |\
    sed 's/ORACLE_PASS/'$ORACLE_PASS'/' |\
    sed 's/BOOTSTRAP_SERVERS/'$BOOTSTRAP_SERVERS'/' > $FILE
done
