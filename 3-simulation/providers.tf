terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = var.AWS_REGION
    shared_config_files = ["~/.aws/credentials"]
    profile = var.AWS_PROFILE
}