echo("Hello from Pipeline");

node("master") {
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


  stage("Building MySQL Docker Image") {
      try {
          sh "./mysql/docker_build.sh"
      }
      catch(e) {
          error "Building Docker Image failed"
      }
  }


  stage("MySQL Unit Test") {
      try {
          sh "./mysql/unit_test.sh"
      }
      catch(e) {
          error "Unit Test failed"
      }
  }

}

