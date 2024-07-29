# 1. VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main_vpc"
  }
}

# 2. Privates Subnetz in AZ a
resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_a_cidr
  availability_zone = "eu-central-1a"

  tags = {
    Name = "private_subnet_a"
  }
}

# 2. Privates Subnetz in AZ b
resource "aws_subnet" "private_subnet_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_b_cidr
  availability_zone = "eu-central-1b"

  tags = {
    Name = "private_subnet_b"
  }
}

# 3. Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_igw"
  }
}

# 4. Public Subnetz in AZ a
resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_a_cidr
  availability_zone = "eu-central-1a"

  tags = {
    Name = "public_subnet_a"
  }
}

# 4. Public Subnetz in AZ b
resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_b_cidr
  availability_zone = "eu-central-1b"

  tags = {
    Name = "public_subnet_b"
  }
}


# 5. Routing Tabelle
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "main_rt"
  }
}

#  6. Route Table Associations mit Public Subnetz a
resource "aws_route_table_association" "rta_public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.rt.id
}

# 6. Route Table Associations mit Public Subnetz b
resource "aws_route_table_association" "rta_public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.rt.id
}