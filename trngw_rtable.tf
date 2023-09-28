resource "aws_route_table" "Trngw1a_RouteTable" {
  vpc_id = aws_vpc.trngwvpc1a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trngwvpc1aigw.id
  }
  route {
    cidr_block         = var.vpc2_cidr[0]
    transit_gateway_id = aws_ec2_transit_gateway.Trngw.id
  }

  tags = {
    Name = "${local.name-prefix}-RouteTable1A"
  }
}
resource "aws_route_table_association" "pubroute2igw41a" {

  depends_on = [
    aws_vpc.trngwvpc1a,
    aws_subnet.trngwvpc1asubnet[0],
    aws_route_table.Trngw1a_RouteTable
  ]
  subnet_id      = aws_subnet.trngwvpc1asubnet[0].id
  route_table_id = aws_route_table.Trngw1a_RouteTable.id
}


############################################################

resource "aws_route_table" "Trngw1b_RouteTable" {
  vpc_id = aws_vpc.trngwvpc1b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trngwvpc1bigw.id
  }
  route {
    cidr_block         = var.vpc1_cidr[0]
    transit_gateway_id = aws_ec2_transit_gateway.Trngw.id
  }

  tags = {
    Name = "${local.name-prefix}-RouteTable1B"
  }
}
resource "aws_route_table_association" "trngwvpc2aigw" {

  depends_on = [
    aws_vpc.trngwvpc1b,
    aws_subnet.trngwvpc1bsubnet[0],
    aws_route_table.Trngw1b_RouteTable
  ]
  subnet_id      = aws_subnet.trngwvpc1bsubnet[0].id
  route_table_id = aws_route_table.Trngw1b_RouteTable.id
}