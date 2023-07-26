resource "aws_eip" "nat-gw-eip" {
  vpc = true
}

resource "aws_nat_gateway" "priv-inst-nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.public-subnets.0.id
  tags = {
    Name = "${var.vpc_name}-NAT GW"
  }

}