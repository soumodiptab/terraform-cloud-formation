# Routing table for connecting Internet Gateway -> public subnet
resource "aws_route_table" "sim-public-rt" {
  vpc_id = aws_vpc.sim-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sim-igw.id
  }
  tags = {
    Name = "Simulation-public-route-table"
  }
}
# instances in public will be able to access internet
resource "aws_route_table_association" "sim-public-rta" {
  subnet_id = aws_subnet.sim-subnet-public.id
  route_table_id = aws_route_table.sim-public-rt.id
}
