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
variable "AWS_AMI_ID" {
    type = map
    default = {
        ap-south-1 = {
            ubuntu = "ami-08e5424edfe926b43"
            linux2 = "ami-021f7978361c18b01"
            amazon2023 = "ami-0da59f1af71ea4ad2"         
        }
        us-east-1 = {
            ubuntu = "ami-0b69ea66ff7391e80"
            linux2 = "ami-021f7978361c18b01"
            amazon2023 = "ami-0da59f1af71ea4ad2"
        }
    }
}
variable "AWS_MACHINE_TYPE_WEB"{
    type = string
    default = "t2.micro"
}
variable "AWS_MACHINE_TYPE_DB"{
    type = string
    default = "t2.micro"
}
variable "AWS_MACHINE_TYPE_BASTION"{
    type = string
    default = "t2.micro"
}
variable "GIT_KEY_PRIVATE_PATH" {
    type = string
    default = "~/.ssh/id_rsa"
}
variable "GIT_KEY_PUBLIC_PATH" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}
variable "GIT_KEY_NAME" {
    type = string
    default = "id_rsa"
}
