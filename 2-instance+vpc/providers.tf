terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = "ap-south-2"
    shared_config_files = ["~/.aws/credentials"]
    profile = "default"
}