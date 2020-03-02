pipeline{
    agent any
    parameters {        
		string(name: 'email', defaultValue: 'tamellaravi789@gmail.com', description: 'Email build notification')        
    }
        stages{
        stage('git clone'){
            steps{
                git 'https://github.com/satishnaidu143/rideeasy.git'
            }
        }
        stage('package'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('archive artifacts'){
            steps{
                archiveArtifacts '**/*.war'
            }
        }
        stage('junit reports'){
            steps{
                junit 'server/target/surefire-reports/*.xml'
            }
        }
		stage('deployment via Docker') {
            steps {
             sh label: '', script: '''pwd
			 whoami
			 sudo scp /var/lib/jenkins/workspace/ride/webapp/target/webapp.war /var/lib/jenkins/workspace/ride
			 docker info
			 docker image build -t ride:01 .
             docker run --name ride -d -p 8090:8080 ride:01'''
      }
   }
	}
    post {		
		success {
			echo "Sending successful email"
			emailext (
				subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """build success ra pulka poye chusukooo""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email"
		}
		failure {
			echo "Emailing failed build"
			emailext (
				subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """build fail ra pulka poye chusukooo""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email!"
		}
		unstable {
			echo "Emailing unstable build"
			emailext (
				subject: "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """build theda iyendhi ra pulka poye chusukooo""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email!"
		}		
	}      
}