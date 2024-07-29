resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "private_rt_a"
  }
}

resource "aws_route_table_association" "rta_private_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "private_rt_b"
  }
}

resource "aws_route_table_association" "rta_private_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_rt_b.id
}