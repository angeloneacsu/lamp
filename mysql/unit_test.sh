#!/bin/bash

#docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest echo "Unit test"
docker run -d --name lamp-mysql-unittest -p 3306:3306 docker.angeloneacsu.com/kilabs/lamp-mysql:latest 

#apt-get update; apt-get install -y curl; 


# because mysql runs inside jenkins container, it needs to know the external IP address of the lamp-apache container (ex: 44606)
# we test DNS resolver as well ;)

echo "Sleep at least 15 seconds... MySQL needs to initialize"

sleep 15
 
#echo "CREATE DATABASE db1; USE db1; CREATE TABLE x (n VARCHAR(20)); INSERT INTO TABLE x values ('muiecuceai'); SELECT * from x"
echo 'CREATE DATABASE db1;' | mysql --host=docker.angeloneacsu.com --user=root --password=pass 

echo 'CREATE TABLE x (n VARCHAR(20));' | mysql --host=docker.angeloneacsu.com --user=root --password=pass db1
echo 'INSERT INTO x(n) values("muiecuceai");' | mysql --host=docker.angeloneacsu.com --user=root --password=pass db1

echo 'SELECT * from x' | mysql --host=docker.angeloneacsu.com --user=root --password=pass db1 | grep -w muiecuceai 

echo "Delete lamp-mysql-unittest container"
docker rm -f lamp-mysql-unittest
