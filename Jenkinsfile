pipeline {
  agent any
  environment {
      TRELLO_KEY = credentials('ff647c29-73bd-436f-a29f-6312e72e7018')
      TRELLO_TOKEN = credentials('8e6177f3-3bff-497b-badc-4b2fa87521c4')
  }
    
  triggers {
    cron '''TZ=Europe/Warsaw 
    H H(0-6) * * *'''
    }
    
  stages {
    stage('Checkout SCM') {
      steps {
        git branch: 'main', url: 'https://github.com/vitaliizghonnik/trello-rest-api-testing.git'
      }
    }

    stage('Run the collection of tests') {
      steps {
          // Use withCredentials step to securely provide Postman API key the pipeline script
          withCredentials([string(credentialsId: 'd7eb88bb-ace9-43c2-bbe1-51f85d1f6126', variable: 'POSTMAN_API_KEY')]) {
          sh '''
            # Run the Newman command
            newman run "https://api.postman.com/collections/23524328-532f1e8e-2b13-413a-a4eb-ae779f08e2d2?access_key=$POSTMAN_API_KEY" --env-var "TrelloKey=$TRELLO_KEY" --env-var "TrelloToken=$TRELLO_TOKEN" -d "Data/data_type_for_checklistName.json" --reporters cli,htmlextra,junit --reporter-htmlextra-skipEnvironmentVars "TrelloKey,TrelloToken" --reporter-htmlextra-skipSensitiveData --reporter-htmlextra-skipHeaders "Authorization,Postman-Token" --reporter-htmlextra-export Trello_report.html --color on --reporter-htmlextra-title "Trello API testing report" --reporter-junit-export Trello_report.xml'''
        
            }
        }
    }
  }
  post {
      always {
          echo 'This will always run'
          publishHTML (target : [allowMissing: false,
                  alwaysLinkToLastBuild: true,
                  keepAll: true,
                  reportDir: 'TrelloAPI_Newman_Pipeline',
                  reportFiles: 'Trello_report.html',
                  reportName: 'Trello_test_HTML_report',
                  reportTitles: 'Trello_test_report'])
          step(checksName: '', skipPublishingChecks: true, $class: 'JUnitResultArchiver', testResults: 'Trello_report.xml')      
      }
      success {
          echo 'This will run only if successful'
      }
      failure {
          echo 'This will run only if Pipeline Failed'
          // Sending an email notification with details about the failure
          mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: 'qatester1719@gmail.com', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "qatester1719@gmail.com";
      }
      unstable {
          echo 'This will run only if the run was marked as unstable'
  }
 }
}