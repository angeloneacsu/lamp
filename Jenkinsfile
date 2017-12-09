echo("Hello from Pipeline");

env.DOCKER_REPO = 'docker.angeloneacsu.com'
env.CLIENT = 'kilabs'
env.PROJECT = lamp

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
                sh 'while ! mysqladmin ping -h docker.angeloneacsu.com --user=root --password=pass -P 53306;do sleep 3; done'
                docker.image('mysql:5').inside("--link ${c.id}:db") {
                    sh 'mysql/unit_test.sh'
                }
            }
        }
        catch(e) {
            error "MySQL Unit-Test failed"
        }
    }

    stage('Push images to private repository'){
        def customApache = docker.build("${env.DOCKER_REPO}/${env.CLIENT}/${env.PROJECT}-apache:${env.BUILD_ID}")
        customApache.push()
        customApache.push('latest')
    }

    stage('Deploy images to Docker Swarm'){
        docker.withServer('tcp://${env.DOCKER_SWARM_MASTER}:2376') {
             sh 'echo test deploy'
        }
    }

}

