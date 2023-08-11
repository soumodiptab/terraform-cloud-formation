# data "template_file" "web_install_script"{
#     template = file("./scripts/bootstrap-web.sh")  
# }

# resource "aws_instance" "node-instance" {
#     ami = var.AWS_AMI_ID[var.AWS_REGION]
#     instance_type = "t2.micro"
#     subnet_id = aws_subnet.sim-subnet-private.id
#     vpc_security_group_ids = [
#         aws_security_group.all_traffic_ssh.id,
#         aws_security_group.http-server.id]
#     key_name = aws_key_pair.demo-key-pair.id
#     user_data = data.template_file.web_install_script.rendered
#     tags = {
#         Name = "node-instance"
#     }
# }
