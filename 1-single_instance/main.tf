resource "aws_instance" "demo" {
    ami = "ami-04a5a6be1fa530f1c"
    instance_type = "t3.micro"
    tags = {
        Name = "demo-instance"
    }
}