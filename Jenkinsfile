pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('access-key')
        AWS_SECRET_ACCESS_KEY = credentials('secret-access-key')
        AWS_REGION = 'ap-south-1'
        S3_BUCKET = 'terraform-state-bucet'
        DYNAMODB_TABLE = 'terraform-lock'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Poojass1998/Employee-Management-App.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
		terraform init \
                  -backend-config="bucket=$S3_BUCKET" \
                  -backend-config="key=terraform.tfstate" \
                  -backend-config="region=$AWS_REGION" \
                  -backend-config="dynamodb_table=$DYNAMODB_TABLE"
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=terraform.tfvars'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply Terraform changes?', ok: 'Yes'
                sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment successful!'
        }
        failure {
            echo 'Terraform deployment failed!'
        }
    }
}
