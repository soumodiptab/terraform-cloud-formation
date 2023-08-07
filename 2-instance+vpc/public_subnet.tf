resource "aws_subnet" "demo-subnet" {
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-2a"
  tags = {
    Name = "demo-public-subnet"
  }
}