resource "aws_subnet" "sim-subnet-private" {
    vpc_id = aws_vpc.sim-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "Simulation-private-subnet"
    }
}
resource "aws_subnet" "sim-subnet-private-2" {
    vpc_id = aws_vpc.sim-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "Simulation-private-subnet-2"
    }
}
resource "aws_subnet" "sim-subnet-private-3" {
    vpc_id = aws_vpc.sim-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-south-1c"
    tags = {
        Name = "Simulation-private-subnet-3"
    }
}