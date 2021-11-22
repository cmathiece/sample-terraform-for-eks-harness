#variable "region" {
#  default     = "us-east-2"
#  description = "AWS region"
#}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}
#
#locals {
#  cluster_name = "education-eks-${random_string.suffix.result}"
#}

#locals {
#  cluster_name = "var.eks_cluster_name-${random_string.suffix.result}"
#}
#locals {
 # cluster_name = "var.eks_cluster_name-${random_string.suffix.result}"
#}


locals {
  cluster_name = var.cluster_name
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  #name                 = "education-vpc"
  name                 = var.vpc_name
 # cidr                 = "10.0.0.0/16"
  cidr                 = var.cidr_value
  azs                  = data.aws_availability_zones.available.names
  #private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  #public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  private_subnets      = var.private_subnets      
  public_subnets       = var.public_subnets       

  enable_nat_gateway   = var.enable_nat_gateway   
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
