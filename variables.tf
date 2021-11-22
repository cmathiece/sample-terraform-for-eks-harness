variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_version" {
  default     = "1.20"
  description = "kubernetes cluster version"
  type = string
}

variable "cluster_tags" {
  description = "kubernetes cluster version"
  type = map(string)
  default = {
    "Environment" = "training"
    "GithubRepo"  = "terraform-aws-eks"
    "GithubOrg"   = "terraform-aws-modules"
  }
}

variable  "cidr_value" {
type = string 
default = "10.0.0.0/16"
}

variable  "vpc_name"{
type = string 
default = "eksmigeration"
}
variable  "cluster_name"{
type = string
#default = "eks_cluster"
default = "sample_eks_cluster_harness"
}

variable  "vpc_version"{
type = string
default  = "3.2.0"
}

variable "enable_nat_gateway" {
default = true
}
variable "single_nat_gateway" {
default = true
}

variable "enable_dns_hostnames" {
default = true
}

variable "private_subnets" {
type = list
default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
type = list
default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

#- new 
variable "public_subnet_cidr" {
  default = ["10.90.46.0/27", "10.90.46.32/27", "10.90.46.64/27", "10.90.46.224/27"]
}

variable "private_subnet_cidr" {
  default = ["10.90.46.0/27", "10.90.46.32/27", "10.90.46.64/27", "10.90.46.224/27"]
}

variable "subnet_azs" {
	default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1c"]
}

#-------



variable "worker_groups_1" {
      type = map(string)
      default = {
	      name                          = "worker-group-1"
	      #instance_type                 = "t2.small"
	      instance_type                 = "t2.large"
	      additional_userdata           = "echo foo bar"
	      asg_desired_capacity          = 2
	      #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
	    }
}

variable "worker_groups_2" {
	type = map(string)
	default = {
	      name                          = "worker-group-2"
	      #instance_type                 = "t2.small"
	      instance_type                 = "t2.xlarge"
	      additional_userdata           = "echo foo bar"
	      asg_desired_capacity          = 2
	      #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
	    }
}


variable "no_worker_groups" {
        type = list(map(string))
	default = [ 
	          { 
		      name                          = "worker-group-1"
		      instance_type                 = "t2.small"
		      additional_userdata           = "echo foo bar"
		      asg_desired_capacity          = 2
		      #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
                 },
		{	
                      name                          = "worker-group-2"
		      instance_type                 = "t2.small"
		      additional_userdata           = "echo foo bar"
		      asg_desired_capacity          = 2
		      #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
		}	
              ]
}
variable "Environment" {
	type = string
	default = "dev"
}

/*
variable "cluster_version" {
	type = string
	default = "1.20"
 
}

*/
