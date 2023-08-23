resource "aws_eip" "my-eip" {
  instance = aws_instance.web-server.id
  vpc      = true
  # meta arguments
  depends_on = [aws_internet_gateway.vpc-dev-igw]
}