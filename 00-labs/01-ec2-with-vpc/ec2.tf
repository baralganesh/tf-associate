data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "web-server" {
  ami = data.aws_ami.amazon-linux-2.id
  # ami         = "ami-047a51fa27710816e" # Supply manually
  instance_type = "t2.micro"
  # availability_zone = "us-east-1a" #Optional, unless wanted to launch ec2 in specific zone
  key_name               = "gbaral-personal"
  subnet_id              = aws_subnet.vpc-dev-public-subnets.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  #user_data = file(apache-install.sh) # or give the contents as below
  user_data = <<-EOF
    #! /bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start  
    sudo systemctl enable httpd
    echo "<h1>Welcome to G Baral Solutions ! AWS Infra created using Terraform</h1>" > /var/www/html/index.html
  EOF
  tags = {
    Name   = "HelloWorld"
    NewTag = "This is new tag"
  }
}