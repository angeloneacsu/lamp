echo("hello from Pipeline");

env.DOCKERHUB_USERNAME = 'angeloneacsu'

node("master") {
  checkout scm

  stage("Building Docker Image") {
      try {
          sh "./apache/docker_build.sh"
      }
      catch(e) {
          error "Building Docker Image failed"
      }
  }


  stage("Unit Test") {
      try {
          sh "./apache/unit_test.sh"
      }
      catch(e) {
          error "Unit Test failed"
      }
  }

  stage("Integration Test") {
      try {
          sh "./integration_test.sh"
      }
      catch(e) {
          error "Integration Test FAILED !"
      }
      finally {
          sh "docker rm -f angeloneacsu/lamp-apache:latest || true"
          sh "docker images -aq -f dangling=true | xargs docker rmi || true"
      }
  }

  stage("Build") {
      sh "docker build -t ${DOCKERHUB_USERNAME}/lamp-apache:${BUILD_NUMBER} ."
  }

}

