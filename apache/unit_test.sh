#!/bin/bash

docker run docker.angeloneacsu.com/kilabs/lamp-apache:latest 'curl -Lv http://localhost:80 && echo $?'
#curl -Lv http://localhost:80 && echo $?
