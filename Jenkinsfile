pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key')
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
                set -e
                cd terraform
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
                sh '''
                set -e
                cd terraform
                terraform plan -var-file=terraform.tfvars \
                  -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
                  -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Apply Terraform changes?', ok: 'Yes'
                sh '''
                set -e
                cd terraform
                terraform apply -auto-approve -var-file=terraform.tfvars \
                  -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
                  -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY"
                '''
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
