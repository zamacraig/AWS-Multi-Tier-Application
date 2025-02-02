# AWS-3-tier-application

## Overview
This project demonstrates the deployment of a 3-tier architecture application on AWS. The architecture consists of the following tiers:
- **Presentation Tier**: User interface layer implemented using a web server.
- **Application Tier**: Business logic layer implemented using application servers.
- **Data Tier**: Database layer implemented using a database server.

## Architecture
The 3-tier architecture includes the following components:
1. **Elastic Load Balancer (ELB)**: Distributes incoming traffic across multiple instances.
2. **Amazon EC2 Instances**: Hosts the application servers.
3. **Amazon RDS**: Relational database service for the data layer.
4. **Amazon VPC**: Virtual Private Cloud for network isolation.
5. **Security Groups**: Controls inbound and outbound traffic to instances.

## Prerequisites
Before deploying the application, ensure you have the following prerequisites:
- AWS account
- AWS CLI installed and configured
- Terraform installed

## Deployment Steps
Follow these steps to deploy the application:

1. Clone the repository:
   ```bash
   git clone https://github.com/zamacraig/AWS-3-tier-application.git
   cd AWS-3-tier-application

2. Initialize the Terraform configuration:

   ```bash
   terraform init

3. Apply the Terraform configuration:

   ```bash
   terraform apply

4. Confirm the changes and wait for the resources to be created.

## Usage
Once the application is deployed, you can access the web interface using the ELB URL. The application handles user requests, processes business logic, and interacts with the database.

## Cleanup
To destroy the infrastructure and clean up resources, run:
   
   ```bash
   terraform destroy
   ```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
...

## Acknowledgements
Special thanks to the contributors and the AWS community for their support and resources.

Feel free to adjust the content as needed. Let me know if there's anything else you'd like to include!
