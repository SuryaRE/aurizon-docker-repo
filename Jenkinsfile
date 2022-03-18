pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-cred-token')
    }
    stages { 
        stage('Checkout external proj') {
        steps {
            git 'https://github.com/SuryaRE/aurizon-docker-repo.git'

            
        }
		}
		stage('Build docker image') {
            steps {  
                
				 sh 'docker build -t suryareo/reo_nodeapp:$BUILD_NUMBER .'
				
            }
        }
		stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
			    
               
				
				sh 'docker push suryareo/reo_nodeapp:$BUILD_NUMBER'
            }
        }
    }
post {
        always {
            sh 'docker logout'
        }
    }
        
}

    
