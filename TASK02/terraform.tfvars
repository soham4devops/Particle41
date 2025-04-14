aws_region          = "us-east-1"
project_name        = "simple-time-service"
environment         = "staging"
vpc_cidr_block      = "10.10.0.0/16"
public_subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs = ["10.10.3.0/24", "10.10.4.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]
container_image_uri = "your_account_id.dkr.ecr.us-east-1.amazonaws.com/simple-time-service:latest"
container_name      = "simple-time-service"
ecs_cluster_name    = "simple-time-cluster"
container_port      = 8080
cpu                 = "256"
memory              = "512"
tags = {
  environment = "staging"
  owner       = "platform-team"
  project     = "simple-time-service"
}
