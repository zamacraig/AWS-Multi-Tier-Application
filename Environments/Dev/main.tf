module "network" {
  source = "../../Modules/network"

  vpc_name           = "dev-vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = var.availability_zone
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
  subnets          = module.network.subnet_ids
  security_groups  = [module.network.security_group_id]
  assign_public_ip = false
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "my-repo"
}