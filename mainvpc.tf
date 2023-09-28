# Create a VPC
resource "aws_vpc" "trngwvpc1a" {
  cidr_block           = var.vpc1_cidr[0]
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.name-prefix}-vpc1a"
  }
}

resource "aws_subnet" "trngwvpc1asubnet" {
  count             = length(var.vpc1_sn_cidr1a)
  vpc_id            = aws_vpc.trngwvpc1a.id
  cidr_block        = var.vpc1_sn_cidr1a[count.index]
  availability_zone = var.az_name[0]
  tags = {
    Name = "${local.name-prefix}-${var.vpc1_sn_name1a[count.index]}"
  }
}

# Create a VPC
resource "aws_vpc" "trngwvpc1b" {
  cidr_block           = var.vpc2_cidr[0]
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.name-prefix}-vpc1b"
  }
}

resource "aws_subnet" "trngwvpc1bsubnet" {
  count             = length(var.vpc2_sn_cidr1b)
  vpc_id            = aws_vpc.trngwvpc1b.id
  cidr_block        = var.vpc2_sn_cidr1b[count.index]
  availability_zone = var.az_name[1]
  tags = {
    Name = "${local.name-prefix}-${var.vpc2_sn_name1b[count.index]}"
  }
}

resource "aws_internet_gateway" "trngwvpc1aigw" {
  vpc_id = aws_vpc.trngwvpc1a.id

  tags = {
    Name = "${local.name-prefix}-IGW1A"
  }
}
resource "aws_internet_gateway" "trngwvpc1bigw" {
  vpc_id = aws_vpc.trngwvpc1b.id

  tags = {
    Name = "${local.name-prefix}-IGW1B"
  }
}