# vpc
resource "aws_vpc" "demo" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
    tags = {
        Name = "webserver"
    }
}

# internet gateway
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo.id
  tags = {
    Name = "main-igw"
  }
}

# route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id 
  }

}

# public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

# associate route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
