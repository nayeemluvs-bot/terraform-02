pipeline {
  agent any

  options {
    timestamps()
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Tool Versions') {
      steps {
        sh 'terraform version'
        sh 'git --version'
      }
    }

    stage('Format Check') {
      steps {
        sh 'terraform fmt -check -recursive'
      }
    }

    stage('Initialize') {
      steps {
        sh 'terraform init -input=false'
      }
    }

    stage('Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Plan') {
      steps {
        sh 'terraform plan -input=false -out=tfplan'
      }
    }

    stage('Approval') {
      steps {
        input message: 'Review the Terraform plan before applying?', ok: 'Approve'
      }
    }

    stage('Apply') {
      steps {
        sh 'terraform apply -input=false tfplan'
      }
    }
  }

  post {
    always {
      archiveArtifacts artifacts: 'tfplan,terraform.lock.hcl', allowEmptyArchive: true
    }
  }
}
