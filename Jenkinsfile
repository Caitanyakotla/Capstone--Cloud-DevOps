pipeline {
    environment{
        registryCredential = 'docker-hub' 
        greenDockerImage = 'caitanyakotla/udacity-krishnac' 
        blueDockerImage = 'caitanyakotla/udacitykrishnaprod'
    }
    agent any 
    stages {
        stage('Install Requirements'){
            steps{
                sh "pip3 install -r requirements.txt"
            }
        }

        stage('Lint Code'){
            steps {
                sh "bash ./run_pylint.sh"
            }
        }

        stage('Set K8S Context'){
            steps {
                withAWS(credentials:'aws-credentials'){
                    sh "kubectl config set-context arn:aws:iam::747565123955:role/eksctl-udacity-krishna-cluster-no-NodeInstanceRole-154HN4NU8UMEL"
                }
            }
        }

        stage('Build Green Docker Image') {
            steps {
                script{
                    greenDockerImage = docker.build "caitanyakotla/udacity-krishnac"
                }
            }
        }

        stage('Upload Green Image to Docker-Hub'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        greenDockerImage.push()
                    }
                }
            }
        }

        stage('Clean Up Green Image'){
            steps { 
                sh "docker rmi caitanyakotla/udacity-krishnac:latest" 
            }
        }

        stage('Green Deployment'){
            steps {
                withAWS(credentials:'aws-credentials'){
                    sh "kubectl apply -f k8s/Green/green-deployment.yaml && kubectl apply -f k8s/Green/test-service.yaml"
                }
            }
        }

        stage('Test Green Deployment'){
            steps{
                input "Deploy to production?"
            }
        }

        stage('Switch Traffic To Green Deployment'){
            steps{
                withAWS(credentials:'aws-credentials'){
                    sh "kubectl apply -f k8s/Green/green-service.yaml"
                }
            }
        }

        stage('Build Blue Docker Image') {
            steps {
                script{
                    blueDockerImage = docker.build "caitanyakotla/udacitykrishnaprod"
                }
            }
        }

        stage('Upload Blue Image to Docker-Hub'){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        blueDockerImage.push()
                    }
                }
            }
        }

        stage('Clean Up Blue Image'){
            steps { 
                sh "docker rmi caitanyakotla/udacitykrishnaprod:latest" 
            }
        }

        stage('Blue Deployment'){
            steps {
                withAWS(credentials:'aws-credentials'){
                    sh "kubectl apply -f k8s/Blue"
                }
            }
        }
    }
}
