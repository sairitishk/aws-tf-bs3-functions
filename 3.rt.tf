resource "aws_route_table" "terraform-public-rt" {
  vpc_id = aws_vpc.bs3-vpc.id
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.nvigw.id
  # }
  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}


resource "aws_route" "puball" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nvigw.id
  route_table_id         = aws_route_table.terraform-public-rt.id

}

resource "aws_route_table_association" "terraform-public" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public-rt.id
}



resource "aws_route_table" "terraform-private-rt" {
  vpc_id = aws_vpc.bs3-vpc.id
  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

resource "aws_route" "privall" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.priv-inst-nat-gw.id
  route_table_id         = aws_route_table.terraform-private-rt.id

}

resource "aws_route_table_association" "terraform-private" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private-rt.id
}
