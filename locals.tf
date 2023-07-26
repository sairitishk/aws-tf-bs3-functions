locals {
  vpc_name   = upper(var.vpc_name)
  proj-id    = format("%s-%s", upper(var.vpc_name), upper(var.environment))
  ingress    = toset([22, 80, 443, 3306, 3389, 222, 222, 222, 33, 33])
  egress     = toset([22, 80, 443, 3306, 3389, 111, 111, 111])
  ingressnew = toset([21, 22, 80, 443])
  egressnew  = toset([21, 22, 80, 443])
  tags       = distinct(["name", "age", "class", "name", "class"])
}
