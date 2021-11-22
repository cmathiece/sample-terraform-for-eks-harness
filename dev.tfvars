region = "us-east-2"
cluster_version = "1.20"
cluster_tags = {
	"Environment" = "training"
	"GithubRepo"  = "terraform-aws-eks"
	"GithubOrg"   = "terraform-aws-modules"
}

cidr_value = "10.0.0.0/16"
#vpc_name   = "eksmigeration"
vpc_name   = "eks_vpc_harness"

cluster_name  = "sample_eks_cluster_harness"
#cluster_name  = "eks_cluster_harness"
vpc_version   =  "3.2.0"


enable_nat_gateway = true

single_nat_gateway = true

enable_dns_hostnames = true

private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

worker_groups_1 =  {
	name                          = "worker-group-1"
	#instance_type                 = "t2.small"
	instance_type                 = "t2.large"
	#additional_userdata           = "echo foo bar"
	additional_userdata           = "dev cluster harness"
	asg_desired_capacity          = 4
	#additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]

}

worker_groups_2 =  {
	name                          = "worker-group-2"
#	instance_type                 = "t2.small"
	instance_type                 = "t2.xlarge"
	#additional_userdata           = "echo foo bar"
	additional_userdata           = "dev cluster harness"
	asg_desired_capacity          = 2
	#additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]

}

Environment = "dev"
#cluster_version = "1.20"
