echo("Hello from Pipeline");

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


}

