#!/bin/bash

#docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest echo "Unit test"
docker run -d --name lamp-apache-unittest -p 4504:80 docker.angeloneacsu.com/kilabs/lamp-apache:latest 

apt-get update; apt-get install -y curl; 
curl -Lv http://localhost:4504

docker rm -f lamp-apache-unittest
