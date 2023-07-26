resource "aws_vpc" "bs3-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = local.vpc_name
    Owner       = "KSR"
    environment = var.environment
    Project_ID  = local.proj-id
  }
}

resource "aws_internet_gateway" "nvigw" {
  vpc_id = aws_vpc.bs3-vpc.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}


# resource "aws_vpc" "bs3nvvpc" {
#   cidr_block = var.vpc_cidr
#   enable_dns_hostnames = true
#   tags = {
#     Name = var.vpc_name
#     env = var.environment
#   }
# }


# resource "aws_internet_gateway" "bs3vpcigw" {
#   vpc_id = aws_vpc.bs3nvvpc
#   tags = {
#     Name = "${var.vpc_name}-IGW"
#   }
#   }