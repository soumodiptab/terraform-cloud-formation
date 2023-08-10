resource "aws_subnet" "sim-subnet-public" {
  vpc_id = aws_vpc.sim-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Simulation-public-subnet"
  }
}