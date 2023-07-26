resource "aws_instance" "web-3" {
  #   count                       = length(var.azs)
  count                       = var.environment == "dev" ? 2 : 1
  ami                         = lookup(var.amis, var.aws_region)
  availability_zone           = element(var.azs, count.index)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name    = "${local.vpc_name}-Private-Instance-${count.index + 1}"
    Env     = var.environment
    Proj-id = local.proj-id
  }
}
