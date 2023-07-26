
resource "aws_security_group" "allow_ssh_only" {

  description = "Allow only SSH traffic"
  vpc_id      = aws_vpc.bs3-vpc.id

  dynamic "ingress" {
    for_each = local.ingressnew
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32", "192.168.1.7/32"]
    }
  }

  dynamic "egress" {
    for_each = local.egressnew
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32", "192.168.1.7/32"]
    }
  }
  tags = {
    Name = "${var.vpc_name}-Allow SSH only-new"
  }
}
