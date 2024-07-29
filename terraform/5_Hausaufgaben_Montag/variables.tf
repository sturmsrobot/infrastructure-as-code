variable "vpc_cidr" {
  description =  "Der CIDR-Block für die VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "Der CIDR-Block für das Public Subnet in AZ a"
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "Der CIDR-Block für das Public Subnet in AZ b"
  default     = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "Der CIDR-Block für das Private Subnet in AZ a"
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "Der CIDR-Block für das Private Subnet in AZ b"
  default     = "10.0.4.0/24"
}