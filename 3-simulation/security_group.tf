resource "aws_security_group" "ssh-server" {
    vpc_id = aws_vpc.sim-vpc.id
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
    tags = {
        Name = "sim-ssh-traffic"
    }
}
# 
resource "aws_security_group" "http-server" {
    vpc_id = aws_vpc.sim-vpc.id
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
        Name = "sim-http-traffic"
    }
}
resource "aws_security_group" "mongo-server" {
    vpc_id = aws_vpc.sim-vpc.id
    #mongo
    ingress{
        from_port = 27017
        to_port = 27017
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "sim-mongo-traffic"
    }
}