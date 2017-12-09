#!/bin/bash

docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest 'apt update; apt -y install curl; curl -Lv http://localhost:80 && echo $?'
#curl -Lv http://localhost:80 && echo $?
