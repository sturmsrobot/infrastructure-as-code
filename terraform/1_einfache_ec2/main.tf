# Dies ist ein Kommentar

# Provider-Definition (Mindestanforderung für "terraform init")
provider "aws" {
  region = "eu-central-1"
}


# Sicherheitsgruppe erstellen und konfigurieren, um SSH, HTTP und HTTPS zu erlauben
resource "aws_security_group" "web_sg" {
  name        = "web_sg"  # Passender Name anhand ihrer Regeln
  description = "Allow SSH, HTTP, and HTTPS traffic"  # Passende Beschreibung anhand ihrer Regeln

  # Regel für eingehenden SSH-Verkehr
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH von überall (IPv4)
  }

  # Regel für eingehenden HTTP-Verkehr
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP von überall (IPv4)
  }

  # Regel für eingehenden HTTPS-Verkehr
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS von überall (IPv4)
  }

  # Regel für ausgehenden Verkehr (erlaubt alle ausgehenden Verbindungen)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2-Instanz erstellen und mit der Sicherheitsgruppe verknüpfen
resource "aws_instance" "beispiel" {
  ami           = "ami-01e444924a2233b07"  # AMI für Amazon Linux 2023
    instance_type = "t2.micro"  # Instance Typ t2.micro

    tags = {
    Name = "Zimtschnecke"  # Namens-Tag: Lieblingsgebäck
  }

vpc_security_group_ids = [aws_security_group.web_sg.id]
}

# Ausgabe der öffentlichen IP-Adresse der EC2-Instanz
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

# Ausgabe des Namens der Sicherheitsgruppe
output "security_group_name" {
  value = aws_security_group.web_sg.name
}

# Ausgabe der ARNs der Sicherheitsgruppenregeln (eine Ausgabe pro Regel)
output "security_group_ingress_ssh_arn" {
  value = aws_security_group.web_sg.ingress[0].id
}

output "security_group_ingress_http_arn" {
  value = aws_security_group.web_sg.ingress[1].id
}

output "security_group_ingress_https_arn" {
  value = aws_security_group.web_sg.ingress[2].id
}





