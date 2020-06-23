#!/bin/bash

curl https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.6.0.0/ojdbc8-19.6.0.0.jar -o kafka-connect-jdbc/confluentinc-kafka-connect-jdbc/lib/ojdbc8-19.6.0.0.jar
# in addition to this some other jars had to be extracted from the manually downloaded ojdbc-full.tar.gz. This can only be downloaded by logging into oracle downloads page. 

# the following version did not work: 
# curl https://maven.xwiki.org/externals/com/oracle/jdbc/ojdbc8/11.2.0.3/ojdbc8-11.2.0.3.jar -o kafka-connect-jdbc/confluentinc-kafka-connect-jdbc/lib/ojdbc8-11.2.0.3.jar
