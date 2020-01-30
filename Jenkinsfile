pipeline{
    agent any
    parameters {        
		string(name: 'email', defaultValue: 'mnsvp111@gmail.com', description: 'Email build notification')        
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
		stage('docker'){
            steps{
                sh label: '', script: ''' cd /home/ubuntu
				whoami
                docker image build -t ride_1.0 .
                docker container run --name ride -d -p 8081:8080 ride_1.0'''
            }
        }
		stage('sending mail'){
			steps{
				emailext body: 'build success', subject: 'jenkins notification', to: 'mnsvp111@gmail.com'
			}
		}
	}
    post {		
		success {
			echo "Sending successful email"
			emailext (
				subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
				<p>Check Allure Report at <link> ${env.BUILD_URL}allure/</link></p>""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email"
		}
		failure {
			echo "Emailing failed build"
			emailext (
				subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """<p>FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
				<p>Check Allure Report at <link> ${env.BUILD_URL}allure/</link></p>""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email!"
		}
		unstable {
			echo "Emailing unstable build"
			emailext (
				subject: "UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
				body: """<p>UNSTABLE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
				<p>Check Allure Report at <link> ${env.BUILD_URL}allure/</link></p>""",
				to: "${params.email}",
				mimeType: 'text/html'
			)
			echo "Sent email!"
		}		
	}      
}