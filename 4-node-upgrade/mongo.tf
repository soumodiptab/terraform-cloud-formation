data "template_file" "db_install_script"{
    template = file("./scripts/bootstrap-db.sh")
}

resource "aws_instance" "mongo-db" {
    ami = lookup(var.AWS_AMI_ID[var.AWS_REGION], "linux2")
    instance_type = "t2.small"
    subnet_id = aws_subnet.sim-subnet-public.id
    vpc_security_group_ids = [
        aws_security_group.ssh-server.id, 
        aws_security_group.mongo-server.id]
    key_name = aws_key_pair.demo-key-pair.id
    user_data = data.template_file.db_install_script.rendered
    tags = {
        Name = "db-instance"
    }
}
