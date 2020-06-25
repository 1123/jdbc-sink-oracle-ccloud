## Demo for JDBC Sink Connector Reading from Confluent Cloud and Writing to Oracle 

In many cases data needs to be exported from Apache Kafka to a relational database. 
Sometimes the destination database will be Oracle. 
While you can write your own custom application to achieve this, this is not the recommended approach. 
Instead, the Kafka Connect framework, and specifically the JDBC Sink connector are the standard solution for solving this business problem. 

This tutorial shows how to export data from a Kafka cluster running in Confluent Cloud to an Oracle database instance in Oracle Cloud. 
A connect cluster is setup up with `docker-compose` and Confluent Control Center is used for improved transparency of the demo. 
This demo has been tested on Mac and linux. 

Before running this demo, you should have some basic familiarity with 

* Kafka: https://kafka.apache.org/
* Confluent Platform: https://www.confluent.io/product/confluent-platform/
* Kafka Connect: https://docs.confluent.io/current/connect/index.html
* the JDBC Sink Connector: https://docs.confluent.io/current/connect/kafka-connect-jdbc/sink-connector/index.html
* Oracle DB
* Confluent Cloud: https://docs.confluent.io/current/cloud/index.html 

If you are interested in the JDBC Source Connector for Oracle for importing data into Kafka from Oracle, check out this tutorial written by my colleague: https://github.com/ora0600/confluent-kafka-oracledb-cdc-light. 

### Prerequisites

* `docker-compose`
* `docker`
* Confluent Platform installed (for tools such as `kafka-console-producer`, `kafka-topics`)
* access to the internet for downloading docker images 
* a Confluent Cloud cluster URL and API-Key and API-Secret 
* access to an Oracle Database (you can get one for free in the Oracle Cloud)
* an Oracle wallet to connect to the database
* a user for the oracle database that is allowed to create tables and insert rows into the tables
* `curl`
* A schema registry API-key and API-secret for Confluent Cloud

### Running the demo

* clone this repository
* `cd jdbc-sink-oracle-ccloud/`
* create your own environment file: `cp envs/template.env envs/dev.env`
* fill in the correct configurations for Confluent Kafka, Confluent Schema Registry, and your Oracle database instance
* source your environment file: `. envs/dev.env` 
* create your own versions of the connector configurations: `./instantiate-templates.sh`
* inspect the generated files: `client.properties`, `oracle-inventory-sink-avro-upsert.json`, `oracle-sink-avro.json`. 
* start the local Kafka Connect Cluster and Confluent Control Center: `docker-compose up -d`
* wait for Confluent Control Center to come up and visit `localhost:9021` to inspect the cluster #
* create your input topic: `./create-inventory-topic.sh`
* create a connector: `./create-connector.sh oracle-inventory-sink-avro-upsert.json` 
* check the connector status `./connector-status.sh oracle-inventory-sink-upsert` 
* send some data to the inventory topic: `./produce-inventory-data-oracle-sink.sh` 
* check the connect logs to see if something has gone wrong: `docker-compose logs -f connect`
* connect to Oracle and check that the data has been inserted. 
