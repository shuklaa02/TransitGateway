#Create TGW
resource "aws_ec2_transit_gateway" "Trngw" {
  description = "Transit GW"
  tags = {
    Name = "${local.name-prefix}-TGW"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "TrngwAttach1a" {
  subnet_ids         = [aws_subnet.trngwvpc1asubnet[0].id]
  transit_gateway_id = aws_ec2_transit_gateway.Trngw.id
  vpc_id             = aws_vpc.trngwvpc1a.id

  tags = {
    Name = "${local.name-prefix}-Attachment1a"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "TrngwAttach1b" {
  subnet_ids         = [aws_subnet.trngwvpc1bsubnet[0].id]
  transit_gateway_id = aws_ec2_transit_gateway.Trngw.id
  vpc_id             = aws_vpc.trngwvpc1b.id

  tags = {
    Name = "${local.name-prefix}-Attachment1b"
  }
}
