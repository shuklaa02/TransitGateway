resource "aws_instance" "App1" {
  count                       = length(var.ec1_ami)
  security_groups             = [aws_security_group.trngw_sg1a.id]
  ami                         = var.ec1_ami[count.index]
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.trngwvpc1asubnet[count.index].id
  associate_public_ip_address = true
  key_name                    = var.ssh_key

  tags = {
    Name = "${local.name-prefix}-App1EC2-1A"
  }
}

resource "aws_instance" "App2" {
  count                       = length(var.ec2_ami)
  security_groups             = [aws_security_group.trngw_sg1b.id]
  ami                         = var.ec2_ami[count.index]
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.trngwvpc1bsubnet[count.index].id
  associate_public_ip_address = true
  key_name                    = var.ssh_key

  tags = {
    Name = "${local.name-prefix}-App2EC2-1B"
  }
}

output "App1_private_dns" {
  description = "AWS private ip of master ec2 ->"
  value       = { for ec2_inst1 in aws_instance.App1[*] : ec2_inst1.tags.Name => ec2_inst1.private_ip }
}

output "App2_private_dns" {
  description = "AWS private ip of master ec2 ->"
  value       = { for ec2_inst2 in aws_instance.App2[*] : ec2_inst2.tags.Name => ec2_inst2.private_ip }
}