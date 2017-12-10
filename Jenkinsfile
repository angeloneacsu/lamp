echo("Hello from Pipeline");

env.DOCKER_REPO = 'docker.angeloneacsu.com'
env.DOCKER_REPO_PORT = '5000'
env.CLIENT = 'kilabs'
env.PROJECT = 'lamp'

node {
    def customApache

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
  
    //stage("Building Apache Docker Image") {
    //    try {
    //        sh "./apache/docker_build.sh"
    //    }
    //    catch(e) {
    //        error "Building Docker Image failed"
    //    }
    //}

    stage('Build Apache docker image') {
            customApache = docker.build("${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/${env.PROJECT}-apache:${env.BUILD_ID}", "-f apache/Dockerfile apache/")
    }

    stage('Push Apache docker image to private repository'){
        docker.withRegistry("http://${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}") {
            customApache.push()
            customApache.push("latest")
        }
    }

    stage('Deploy images to Docker Swarm'){
            docker.withServer('tcp://${env.DOCKER_SWARM_MASTER}:2376') {
                sh 'echo Create docker-compose.yml'
                sh './create-docker-compose.sh'                
                sh 'cat create-docker-compose.sh'
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
  
    
//    stage("MySQL Unit Test") {
//        try {
//            docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=pass" -p 53306:3306') { c ->
//                sh 'while ! mysqladmin ping -h docker.angeloneacsu.com --user=root --password=pass -P 53306;do sleep 3; done'
//                docker.image('mysql:5').inside("--link ${c.id}:db") {
//                    sh 'mysql/unit_test.sh'
//                }
//            }
//        }
//        catch(e) {
//            error "MySQL Unit-Test failed"
//        }
//    }

}

