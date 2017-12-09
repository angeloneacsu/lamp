#!/bin/bash

#docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest echo "Unit test"
docker run -d --name lamp-mysql-unittest -p 3306:3306 docker.angeloneacsu.com/kilabs/lamp-mysql:latest 

#apt-get update; apt-get install -y curl; 


# because mysql runs inside jenkins container, it needs to know the external IP address of the lamp-apache container (ex: 44606)
# we test DNS resolver as well ;)

echo "Select * from T1"

echo "select * from t1;" | mysql --host=docker.angeloneacsu.com --user=root --password=pass db1 

echo "Delete lamp-mysql-unittest container"
docker rm -f lamp-mysql-unittest
