cat > stack-deploy.yml <<EOF
version: "3.3"

services:
   backend:
      image: ${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/lamp-mysql:latest
      ports:
         - "50080:80"
      deploy:
        resources:
          limits:
            memory: 512M
   frontend:
      image: ${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/lamp-apache:latest
      ports:
         - "53306:3306"
      deploy:
        resources:
          limits:
            memory: 128M
EOF
