variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}

locals { name-prefix = "${var.project_name}-${var.environment}" }

variable "ec1_ami" {
  type = list(string)
}

variable "ec2_ami" {
  type = list(string)
}

variable "vpc1_cidr" {
  description = "vpc cidr"
  type        = list(string)
}
variable "vpc2_cidr" {
  description = "vpc cidr"
  type        = list(string)
}

variable "vpc1_sn_name1a" {
  description = "subnet name"
  type        = list(string)
}
variable "vpc2_sn_name1b" {
  description = "subnet name"
  type        = list(string)
}

variable "vpc1_sn_cidr1a" {
  description = "subnet cidr"
  type        = list(string)
}
variable "vpc2_sn_cidr1b" {
  description = "subnet cidr"
  type        = list(string)
}

variable "az_name" {
  description = "az name"
  type        = list(string)
}

variable "ssh_key" {
  description = "ssh key"
  type        = string
}