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

# Helloworld Appication code
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "ec2-user"
      private_key = file("/home/ec2-user/environment/.ssh/EffectiveDevOpsAWS.pem")
    }
    inline = [
      "sudo yum install --enablerepo=epel -y nodejs",
      "sudo wget https://raw.githubusercontent.com/yogeshraheja/Effective-DevOps-with-AWS/master/Chapter02/helloworld.js -O /home/ec2-user/helloworld.js",
      "sudo wget https://raw.githubusercontent.com/yogeshraheja/Effective-DevOps-with-AWS/master/Chapter02/helloworld.conf -O /etc/init/helloworld.conf",
      "sudo start helloworld",
    ]
  }
}