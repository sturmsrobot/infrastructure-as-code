locals {
  subnets = [
    { cidr = "10.0.1.0/24", az = "eu-central-1a", type = "public" },
    { cidr = "10.0.2.0/24", az = "eu-central-1b", type = "public" },
    { cidr = "10.0.3.0/24", az = "eu-central-1a", type = "private" },
    { cidr = "10.0.4.0/24", az = "eu-central-1b", type = "private" }
  ]
}

resource "aws_subnet" "subnets" {
  for_each = { for subnet in local.subnets : subnet.cidr => subnet }

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${each.value.type}_subnet_${each.value.az}"
  }
}