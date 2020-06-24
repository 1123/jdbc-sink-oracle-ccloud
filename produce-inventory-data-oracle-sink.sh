echo '{ "u_id": 1, "u_quantity": 12, "u_price": 12.0, "u_name": "glasses" }
{ "u_id": 2, "u_quantity": 12, "u_price": 12.0, "u_name": "ring" }
{ "u_id": 3, "u_quantity": 2, "u_price": 712.0, "u_name": "bike" }' | kafka-avro-console-producer \
  --broker-list $BOOTSTRAP_SERVERS \
  --property schema.registry.url=$SCHEMA_REGISTRY_URL \
  --property basic.auth.credentials.source=USER_INFO \
  --property schema.registry.basic.auth.user.info=$SCHEMA_REGISTRY_KEY:$SCHEMA_REGISTRY_SECRET \
  --producer.config client.properties \
  --topic inventory \
  --property value.schema='{
  "type":"record",
  "name":"myrecord",
  "fields":[
    {"name":"u_id","type":"int"},
    {"name":"u_name","type":"string"},
    {"name":"u_price", "type": "float"}, 
    {"name":"u_quantity", "type": "int"}
  ]
}'
