# Employee-Management-App

Project: Employee Management System (EMS) on AWS

Project Overview:
* A ReactJS frontend
* A Node.js backend (running on EC2)
* Amazon RDS for database storage
* S3 for storing employee documents
* DynamoDB for application metadata storage
* Jenkins CI/CD for deployment automation
* Terraform to manage infrastructure

Architecture:
* Frontend → Hosted on EC2 (or S3 + CloudFront for static hosting)
* Backend API (Node.js) → Runs on EC2 with an ALB (Application Load Balancer)
* Database (Amazon RDS - MySQL) → Stores employee records
* Storage (S3) → Stores employee-related documents (ID proof, resumes, etc.)
* State Management (S3 + DynamoDB) → Stores Terraform state files
* CI/CD (Jenkins) → Automates deployment
* IAM Policies → Restrict access to services