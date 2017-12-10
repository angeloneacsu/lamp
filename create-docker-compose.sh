#!/bin/sh

env

cat > stack-deploy.yml <<EOF
version: "3.3"

services:
   backend:
      image: ${DOCKER_REPO}:${DOCKER_REPO_PORT}/${CLIENT}/lamp-mysql:${BUILD_ID}
      ports:
         - "53306:3306"
      deploy:
        resources:
          limits:
            memory: 512M
   frontend:
      image: ${DOCKER_REPO}:${DOCKER_REPO_PORT}/${CLIENT}/lamp-apache:${BUILD_ID}
      ports:
         - "50080:80"
      deploy:
        resources:
          limits:
            memory: 128M
EOF

cat stack-deploy.yml

