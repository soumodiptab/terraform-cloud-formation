data "template_file" "install_script"{
    template = file("./scripts/install.sh")  
}

resource "aws_instance" "node-instance" {
    ami = "ami-04a5a6be1fa530f1c"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sim-subnet-private.id
    vpc_security_group_ids = [aws_security_group.node-sg.id]
    key_name = aws_key_pair.demo-key-pair.id
    user_data = data.template_file.install_script.rendered
    tags = {
        Name = "demo-instance"
    }
}
