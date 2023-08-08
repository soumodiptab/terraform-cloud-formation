resource "aws_resource" "sim-subnet-private" {
    vpc_id = aws_vpc.sim-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "Simulation-private-subnet"
    }
}