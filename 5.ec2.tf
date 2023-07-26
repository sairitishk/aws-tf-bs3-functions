resource "aws_instance" "web-1" {
  count                       = length(var.azs)
  ami                         = lookup(var.amis, var.aws_region)
  availability_zone           = element(var.azs, count.index)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name    = "${local.vpc_name}-Public-Instance-${count.index + 1}"
    Env     = var.environment
    Proj-id = local.proj-id
  }

  
}


# resource "aws_instance" "web-1" {
#   count                       = length(var.azs)
#   ami                         = lookup(var.amis, var.aws_region)
#   availability_zone           = var.azs[0]
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.public-subnets.0.id
#   vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name    = "${local.vpc_name}-Public-Instance-${count.index + 1}"
#     Env     = var.environment
#     Proj-id = local.proj-id
#   }
# }

resource "aws_instance" "web-2" {
  ami                         = lookup(var.amis, var.aws_region)
  availability_zone           = var.azs[0]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnets.0.id
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh_only.id}"]
  associate_public_ip_address = true
  tags = {
    Name    = "${local.vpc_name}-Public-Instance-SSH-Only"
    Env     = var.environment
    Proj-id = local.proj-id
  }


}
