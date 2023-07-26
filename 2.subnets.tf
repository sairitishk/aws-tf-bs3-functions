
resource "aws_subnet" "public-subnets" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.bs3-vpc.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-Public-Subnet-${count.index + 1}"
  }
}


resource "aws_subnet" "private-subnets" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.bs3-vpc.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-Private-Subnet-${count.index + 1}"
  }
}


# resource "aws_subnet" "pubsub" {
#   count = length(var.public_subnet_cidr)
#   vpc_id = aws_vpc.bs3-vpc.id
#   cidr_block = element(var.public_subnet_cidr, count.index)
#   availability_zone = element(var.azs, count.index)
#   tags = {
#     Name = "${var.vpc_name}-Public Subnet-${count.index + 1}"
#     Env = var.environment
#   }

# }