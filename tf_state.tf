terraform {
  backend "s3" {
    bucket = "tf-state-bucket-mpl"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}
