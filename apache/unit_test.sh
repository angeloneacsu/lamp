#!/bin/bash

docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest 'echo "Unit test"'
#docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest 'apt-get update; apt-get install -y curl; curl -Lv http://localhost:80 && echo $?'
#curl -Lv http://localhost:80 && echo $?
