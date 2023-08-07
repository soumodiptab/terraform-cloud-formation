resource "aws_instance" "demo-instance" {
    ami = "ami-04a5a6be1fa530f1c"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.demo-subnet.id
    vpc_security_group_ids = [aws_security_group.demo-sg.id]
    key_name = aws_key_pair.demo-key-pair.id
    provisioner "file" {
        source = "scripts/install.sh"
        destination = "/tmp/install.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install.sh",
            "sudo /tmp/install.sh"
        ]
    }
    connection {
        type = "ssh"
        user = var.EC2_USER
        private_key = file(var.AWS_KEY_PAIR_PRIVATE_PATH)
        host = self.public_ip
    }
    tags = {
        Name = "demo-instance"
    }
}