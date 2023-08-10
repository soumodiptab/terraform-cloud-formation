resource "aws_internet_gateway" "sim-igw" {
    vpc_id = aws_vpc.sim-vpc.id
    tags = {
        Name = "sim-igw"
    }
}