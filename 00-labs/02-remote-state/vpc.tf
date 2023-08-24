# create vpc
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
}

# create subnets
resource "aws_subnet" "vpc-dev-public-subnets" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# create internet gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# create route table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# create route in route table for internet access
resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# associate the route table with the subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  subnet_id      = aws_subnet.vpc-dev-public-subnets.id
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
}

