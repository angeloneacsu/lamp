echo("Hello from Pipeline");

env.DOCKER_SWARM_PROD = 'tcp://docker.angeloneacsu.com:2375'
//env.DOCKER_HOST = 'tcp://docker.angeloneacsu.com:2375'
env.DOCKER_REPO = 'docker.angeloneacsu.com'
env.DOCKER_REPO_PORT = '5000'
env.CLIENT = 'kilabs'
env.PROJECT = 'lamp'

node {
    def ApacheImage
    def MysqlMicroservice

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
        sh 'git rev-parse HEAD > .rev'
        rev = readFile('.rev').trim()
    }
  
    //stage("Building Apache Docker Image") {
    //    try {
    //        sh "./apache/docker_build.sh"
    //    }
    //    catch(e) {
    //        error "Building Docker Image failed"
    //    }
    //}

// Apache Stages
    stage('Build Apache docker image') {
                // docker.withServer("$DOCKER_SWARM_PROD") {
                ApacheImage = docker.build("${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/${env.PROJECT}-apache:${env.BUILD_ID}", "-f apache/Dockerfile apache/")
                // }
    }

    stage('Push Apache docker image to private repository'){
                 docker.withRegistry("http://${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}") {
                     // docker.withServer('${env.DOCKER_SWARM_PROD}') {
                     ApacheImage.push()
                     ApacheImage.push("latest")
                     //}
                }
    }


// I can ONLY use "docker service create" on Swarm
//    stage('Deploy Apache Service into Docker Swarm'){
//            docker.withServer('tcp://${env.DOCKER_SWARM_PROD}:2376') {
//                sh "docker service create --name lamp-apache --publish 50080:80 ${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/${env.PROJECT}-apache:${env.BUILD_ID}"
//            }
//    }

// MySQL Stages
    stage('Build MySQL docker image') {
            MySQLMicroservice = docker.build("${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}/${env.CLIENT}/${env.PROJECT}-mysql:${env.BUILD_ID}", "-f mysql/Dockerfile mysql/")
    }

    stage('Push MySQL docker image to private repository'){
        docker.withRegistry("http://${env.DOCKER_REPO}:${env.DOCKER_REPO_PORT}") {
            MySQLMicroservice.push()
            MySQLMicroservice.push("latest")
        }
    }

    stage('Create Docker Compose'){
            sh 'echo Create docker-compose.yml'
            sh './create-docker-compose.sh'                
            sh 'cat stack-deploy.yml'
    }


    stage('Create Docker Compose'){
            sh 'docker version'
            sh 'echo Create docker-compose.yml'
            sh './create-docker-compose.sh'                
            sh 'cat stack-deploy.yml'
    }

    stage('Deploy LAMP stack to Docker Swarm'){
    //        docker.withServer('tcp://${env.DOCKER_SWARM_PROD}:2376') {
                //sh 'docker stack rm LAMP'
                sh 'docker stack deploy -c stack-deploy.yml LAMP'
    //        }
    }
  
//    stage("Apache Unit Test") {
//        try {
//            sh "./apache/unit_test.sh"
//        }
//        catch(e) {
//            error "Unit Test failed"
//        }
//    }
  
    
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

