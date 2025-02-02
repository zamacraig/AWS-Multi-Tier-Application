module "network" {
  source = "../../Modules/network"

  public_subnet_port = var.public_subnet_port
  private_subnet_port = var.private_subnet_port
  sns_email = var.sns_email
  vpc_name = "3-Tier Application"
}

module "ecs_cluster" {
  source = "../../Modules/ecs_cluster"

  region = var.region

  cluster_name     = "dev-ecs-cluster"
  service_name     = "dev-ecs-service"

  family           = "dev-task"

  memory           = "512"
  cpu              = "256"
  image            = "123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repo:latest"

  desired_count    = 0
  subnets          = module.network.public_subnet_ids
  security_groups  = [module.network.private_security_group_id]
  assign_public_ip = false
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "my-repo"
}