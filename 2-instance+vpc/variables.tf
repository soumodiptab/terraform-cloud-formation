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