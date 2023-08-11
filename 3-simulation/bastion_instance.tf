data "template_file" "bastion_install_script"{
    template = file("./scripts/bootstrap-bastion.sh")  
}

resource "aws_instance" "bastion-instance" {
    ami = var.AWS_AMI_ID[var.AWS_REGION]
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sim-subnet-public.id
    vpc_security_group_ids = [aws_security_group.ssh-server.id]
    key_name = aws_key_pair.demo-key-pair.id
    user_data = data.template_file.bastion_install_script.rendered
    tags = {
        Name = "bastion-instance"
    }
}
