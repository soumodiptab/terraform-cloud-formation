data "template_file" "install_script"{
    template = file("./scripts/bootstrap-web.sh")  
}

resource "aws_instance" "demo-instance" {
    ami = lookup(var.aws_amis[var.aws_region], "amazon2023")
    instance_type = "t2.medium"
    subnet_id = aws_subnet.sim-subnet-public.id
    vpc_security_group_ids = [
        aws_security_group.http-server.id,
        aws_security_group.ssh-server.id
        ]
    key_name = aws_key_pair.demo-key-pair.id
    provisioner "file" {
        source = var.GIT_KEY_PRIVATE_PATH
        destination = "/home/${var.EC2_USER}/id_rsa"
    }
    provisioner "file" {
        source = var.GIT_KEY_PUBLIC_PATH
        destination = "/home/${var.EC2_USER}/id_rsa.pub"
    }
    user_data = data.template_file.install_script.rendered
    tags = {
        Name = "Platform Instance"
    }
}
