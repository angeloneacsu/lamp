#!/bin/bash

#docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest echo "Unit test"
docker run -d --name lamp-apache-unittest -p 44606:80 docker.angeloneacsu.com/kilabs/lamp-apache:latest 

#apt-get update; apt-get install -y curl; 
# because curl runs inside jenkins container, it needs to know the external IP address of the lamp-apache container (ex: 44606)
curl -Lv http://localhost:44606

docker rm -f lamp-apache-unittest
