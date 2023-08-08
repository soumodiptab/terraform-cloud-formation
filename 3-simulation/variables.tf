variable "AWS_KEY_PAIR_PUBLIC_PATH" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}
variable "AWS_KEY_PAIR_PRIVATE_PATH" {
    type = string
    default = "~/.ssh/id_rsa"
}
variable "AWS_KEY_PAIR_NAME" {
    type = string
    default = "id_rsa"
}
variable "EC2_USER"{
    type = string
    default = "ubuntu"  
}
variable "AWS_REGION" {
    type = string
    default = "ap-south-1"
}
variable "AWS_PROFILE" {
    type = string
    default = "default"
}
# create a variable for the AMI ID to map different AMI IDs for different regions
variable "AMI_ID" {
    type = map
    default = {
        ap-south-1 = "ami-08e5424edfe926b43"
        us-east-1 = "ami-0b69ea66ff7391e80"
    }
}