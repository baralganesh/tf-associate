data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  # ami         = "ami-047a51fa27710816e" # Supply manually
  instance_type = "t2.micro"
  availability_zone = "us-east-1a" #Optional, unless wanted to launch ec2 in specific zone

  tags = {
    Name = "HelloWorld"
    NewTag = "This is new tag"
  }
}