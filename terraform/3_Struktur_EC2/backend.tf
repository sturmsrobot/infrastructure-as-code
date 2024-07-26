terraform {
    backend "s3" {
      bucket = "techstarter-tf-test"
      key = "ec2-terraform/terraform.tfstate"
      region = "eu-central-1"
    }
}