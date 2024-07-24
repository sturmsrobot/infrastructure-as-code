# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}

# Sicherheitsgruppen verwenden
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Eine Ubuntu EC2 Instanz im kleinen t2.nano-Format
resource "aws_instance" "erste_instanz" {
  instance_type = "t2.nano"
  ami = "ami-01e444924a2233b07"
  vpc_security_group_ids = [ "sg-0a3fe4f9a1c13ef19" ]
  tags = {
    Name = "Terraform Beispiel"
  }
}


