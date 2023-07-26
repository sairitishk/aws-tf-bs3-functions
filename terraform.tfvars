aws_region          = "us-east-1"
vpc_cidr            = "10.30.0.0/16"
public_subnet_cidr  = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
private_subnet_cidr = ["10.30.10.0/24", "10.30.20.0/24", "10.30.30.0/24"]
key_name            = "test"
environment         = "dev"
vpc_name            = "bs3-vpc"
azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
instance_type       = "t2.micro"
amis = {
  us-east-1 = "ami-09437041008711081"
  us-east-2 = "ami-00c6c849418b7612c"
}
