data "template_file" "install_script"{
    template = file("./scripts/bootstrap-al2023.sh")  
}

resource "aws_instance" "demo-instance" {
    ami = lookup(var.AWS_AMI_ID[var.AWS_REGION], "amazon2023")
    instance_type = "t2.medium"
    subnet_id = aws_subnet.sim-subnet-public.id
    associate_public_ip_address = true
    vpc_security_group_ids = [
        aws_security_group.http-server.id,
        aws_security_group.ssh-server.id
        ]
    key_name = aws_key_pair.demo-key-pair.id
    provisioner "file" {
        source = var.GIT_KEY_PRIVATE_PATH
        destination = "/home/${var.EC2_USER}/.ssh/id_rsa"
    }
    provisioner "file" {
        source = var.GIT_KEY_PUBLIC_PATH
        destination = "/home/${var.EC2_USER}/.ssh/id_rsa.pub"
    }
    connection {
        type = "ssh"
        user = var.EC2_USER
        private_key = file(var.AWS_KEY_PAIR_PRIVATE_PATH)
        host = self.public_ip
    }
    user_data = data.template_file.install_script.rendered
    tags = {
        Name = "Node Instance"
    }
}
