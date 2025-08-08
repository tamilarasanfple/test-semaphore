provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "merchant_sg" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id
  tags        = var.common_tags

  ingress {
    description = "GHero VPN"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["46.137.201.61/32"]
  }

  ingress {
    description = "GHero Thai VPN"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["150.95.67.0/32"]
  }

  ingress {
    description = "Jenkins_v2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["54.179.41.37/32"]
  }

ingress {
    description = "${var.common_tags["Project"]}_pub (Self EIP)"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.this.public_ip}/32"]
}

  ingress {
    description = "GHero VPN"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["46.137.201.61/32"]
  }

  ingress {
    description = "Jenkins_v2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["54.179.41.37/32"]
  }

  ingress {
    description = "GHero Thai VPN"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["150.95.67.0/32"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
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

resource "aws_eip" "this" {
  domain = "vpc"
  tags = var.common_tags
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = [aws_security_group.merchant_sg.id]
  iam_instance_profile   = var.iam_role_name
  key_name               = var.key_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
    tags        = var.common_tags
  }

  tags = var.common_tags
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}

