resource "aws_security_group" "node-sg" {
    vpc_id = aws_vpc.demo-vpc.id
    # allow host to connect to internet
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
    #ssh
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #http
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #test port
    ingress{
        from_port = 6069
        to_port = 6069
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #https
    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "security-group-node-server"
    }
}
# 
resource "aws_security_group" "db-sg" {
    vpc_id = aws_vpc.demo-vpc.id
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 6069
        to_port = 6069
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "demo-sg"
    }
}