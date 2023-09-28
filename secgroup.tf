variable "ports" {
  type    = list(number)
  default = [22]
}

resource "aws_security_group" "trngw_sg1a" {
  name        = "Transit_GW_SG1a"
  description = "Allow transit GW inbound traffic"
  vpc_id      = aws_vpc.trngwvpc1a.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.vpc2_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${local.name-prefix}_SG1a"
  }
}

resource "aws_security_group" "trngw_sg1b" {
  name        = "Transit_GW_SG1b"
  description = "Allow transit GW inbound traffic"
  vpc_id      = aws_vpc.trngwvpc1b.id

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.vpc1_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${local.name-prefix}_SG1b"
  }
}
