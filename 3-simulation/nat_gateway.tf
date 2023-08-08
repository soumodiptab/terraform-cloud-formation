resource "aws_eip" "nat_eip" {
  vpc = true
}
resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.sim-subnet-public.id
    tags = {
        Name = "Simulation-nat-gateway"
    }
}