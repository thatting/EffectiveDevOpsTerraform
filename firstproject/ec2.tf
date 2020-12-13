# Provider Configuration for AWS
provider "aws" {
  region     = "us-east-1"
}


# Resource Configuration for AWS
resource "aws_instance" "myserver" {
  ami = "ami-cfe4b2b0"
  instance_type = "t2.micro"
  key_name = "EffectiveDevOpsAWS"
  vpc_security_group_ids = ["sg-01c36c5d04d854afb"]
  tags = {
    Name = "helloworld"
  }
}

