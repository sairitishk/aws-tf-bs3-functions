output "aws_vpc_id" {
  value = aws_vpc.bs3-vpc.id
}

output "public-subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = ["${aws_subnet.public-subnets.*.id}"]
}

output "private-subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = ["${aws_subnet.private-subnets.*.id}"]
}

output "pubsub-0-id" {
  value = ["${aws_subnet.public-subnets.0.id}"]

}