echo("Hello from Pipeline");

node {
  checkout scm

  stage("Building Apache Docker Image") {
      try {
          sh "./apache/docker_build.sh"
      }
      catch(e) {
          error "Building Docker Image failed"
      }
  }


  stage("Apache Unit Test") {
      try {
          sh "./apache/unit_test.sh"
      }
      catch(e) {
          error "Unit Test failed"
      }
  }


  stage("MySQL Unit Test") {
      try {
          docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=pass" -p 53306:3306') { c ->
              sh 'while ! mysqladmin ping -h 0.0.0.0 --silent;do sleep 1; done'
              sh 'CREATE DATABASE db1;'
          }
      }
      catch(e) {
          error "Building Docker Image failed"
      }
  }


}

