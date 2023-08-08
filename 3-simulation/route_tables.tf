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

resource "aws_route_table_association" "sim-public-rta" {
  subnet_id = aws_subnet.sim-subnet-public.id
  route_table_id = aws_route_table.sim-public-rt.id
}

# Routing table for connecting Public subnet to NAT Gateway
resource "aws_route_table" "sim-nat-rt" {
  vpc_id = aws_vpc.sim-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
    tags = {
        Name = "Simulation-nat-route-table"
    }
}
resource "aws_route_table_association" "sim-nat-rta" {
    subnet_id = aws_subnet.sim-subnet-private.id
    route_table_id = aws_route_table.sim-nat-rt.id
}

# Routing table for connecting NAT Gateway -> private subnet
# resource "aws_route_table" "sim-private" {
#     vpc_id = aws_vpc.sim-vpc.id
#     route {
#         cidr_block = "0.0.0.0/0"

#     }
#     tags = {
#         Name = "Simulation-private-route-table"
#     }
# }