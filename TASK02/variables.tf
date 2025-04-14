variable "aws_region" {}
variable "project_name" {}
variable "environment" {}
variable "vpc_cidr_block" {}
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }
variable "ecs_cluster_name" {}
variable "container_image_uri" {}
variable "container_name" {}
variable "container_port" {}
variable "cpu" {}
variable "memory" {}
variable "tags" { type = map(string) }
