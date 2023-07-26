data "http" "myip" {
  url = "https://ipconfig.io/"

}

resource "aws_security_group" "allow_all" {

  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.bs3-vpc.id

  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  # }
  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32", "0.0.0.0/0"]
    }
  }
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  dynamic "egress" {
    for_each = local.egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32", "0.0.0.0/0"]
    }
  }
  tags = {
    Name = "${var.vpc_name}-Allow All SG-new"
  }
}
