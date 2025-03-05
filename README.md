# AWS Multi-Tier Application
Welcome to the AWS Multi-Tier Application repository! 🚀 This project uses Terraform configuration files to provision a robust, multi-tier AWS infrastructure. The architecture includes an application hosted on Amazon ECS with a back-end database on Amazon RDS, along with an Elastic Container Registry (ECR) for managing container images. The design leverages public and private subnets for optimal security and scalability.

## Features
- Multi-Tier Architecture:

  - Application Layer: Containers deployed on ECS, distributed across two public subnets.

  - Data Layer: Amazon RDS set up across two private subnets for enhanced security.

- Container Registry: Provisioning of Amazon ECR for hosting and managing container images.

- Infrastructure as Code (IaC): Deploy resources using Terraform for consistency and repeatability.

- Scalability: Easily scale your application with AWS services like ECS and RDS.

- Security: Use private subnets for the database and restrict access using security groups and IAM roles.

- Cost Efficiency: Leverage AWS services to optimize resource utilization.

## Architecture Diagram
![image](https://github.com/user-attachments/assets/9af6ddf1-1a45-47cc-8c25-d61e82467f46)


## Architecture Overview
The infrastructure provisions:

1. ECS (Elastic Container Service):

   - Hosts the application containers across two public subnets.
 
   - Load balancing via an Application Load Balancer (ALB) for improved availability.

2. ECR (Elastic Container Registry):

   - Stores and manages container images securely.

   - Simplifies deployment by integrating directly with ECS.

3. RDS (Relational Database Service):

   - Deployed in two private subnets for secure data storage.

   - Designed for high availability and fault tolerance with Multi-AZ support.

## Networking
- Two public subnets for the ECS service.

- Two private subnets for the RDS database.

- Internet Gateway and NAT Gateway for controlled internet access.

## Getting Started
Follow these steps to set up and deploy the infrastructure:

## Prerequisites
Ensure you have:

- AWS account and AWS CLI configured

- Terraform installed on your machine

- Docker installed and configured to build container images

- SSH key pair for accessing ECS instances (if needed)

## Installation
1. Clone the repository:

```bash
git clone https://github.com/zamacraig/AWS-Multi-Tier-Application.git
```

2. Navigate to the project directory:

```bash
cd AWS-Multi-Tier-Application
```

## Deployment
1. Navigate to the terraform/ directory:

```bash
cd terraform
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the Terraform configuration to provision resources:

```bash
terraform apply
```

4. Push container images to the ECR repository:

```bash
docker build -t your-ecr-repo-name .
aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-account-id.dkr.ecr.your-region.amazonaws.com
docker tag your-image:latest your-account-id.dkr.ecr.your-region.amazonaws.com/your-ecr-repo-name:latest
docker push your-account-id.dkr.ecr.your-region.amazonaws.com/your-ecr-repo-name:latest
```

5. Verify that the ECS service and RDS database are running on AWS.

## Contributing
We welcome contributions! Feel free to open issues or submit pull requests to improve this project.
