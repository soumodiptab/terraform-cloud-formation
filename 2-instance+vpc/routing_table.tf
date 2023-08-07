resource "aws_route_table" "demo-rt" {
    vpc_id = aws_vpc.demo-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo-igw.id
    }
    tags = {
      Name = "demo-public-rt"
    }
}

resource "aws_route_table_association" "demo-rt-assoc" {
  subnet_id = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-rt.id
}