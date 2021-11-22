module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  #cluster_version = "1.20"
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets

  tags = {
    #Environment = "training"
    Environment =  var.Environment
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

/*
  worker_groups = [
    {
      name                          = "worker-group-1"
      #instance_type                 = "t2.small"
      instance_type                 = "t2.large"
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "worker-group-2"
      #instance_type                 = "t2.medium"
      instance_type                 = "t2.xlarge"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]

} */



worker_groups = [
    {
      name                          = var.worker_groups_1["name"]
      instance_type                 = var.worker_groups_1["instance_type"]
      additional_userdata           = var.worker_groups_1["additional_userdata"]
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = var.worker_groups_1["asg_desired_capacity"]
    },
    {
      name                          = var.worker_groups_2["name"]
      instance_type                 = var.worker_groups_2["instance_type"]
      additional_userdata           = var.worker_groups_2["additional_userdata"]
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = var.worker_groups_2["asg_desired_capacity"]
    },
  ]

}


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
  }

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
  }

