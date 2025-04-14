provider "aws" {
  region = var.aws_region
}

module "network" {
  source              = "./modules/network"
  project_name        = var.project_name
  environment         = var.environment
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                 = var.azs
  tags                = var.tags
}

module "alb" {
  source                = "./modules/alb"
  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.network.vpc_id
  alb_subnet_ids        = module.network.public_subnet_ids
  alb_security_group_id = module.network.alb_sg_id
  target_port           = var.container_port
  tags                  = var.tags
}

module "ecs" {
  source                      = "./modules/ecs"
  project_name                = var.project_name
  environment                 = var.environment
  ecs_cluster_name            = var.ecs_cluster_name
  container_image_uri         = var.container_image_uri
  container_name              = var.container_name
  container_port              = var.container_port
  cpu                         = var.cpu
  memory                      = var.memory
  private_subnet_ids          = module.network.private_subnet_ids
  service_security_group_id   = module.network.ecs_service_sg_id
  target_group_arn            = module.alb.target_group_arn
  lb_listener_arn             = module.alb.listener_arn
  execution_role_arn          = module.ecs.execution_role_arn
  tags                        = var.tags
}
