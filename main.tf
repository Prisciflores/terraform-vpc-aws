# main.tf

provider "aws" {
  region = var.region # viene de las variables
}

# Crear la VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

# Subnet pública
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Subnet privada
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.name_prefix}-private-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

# 🗺️ Route Table: define cómo salir de la red (a través del Internet Gateway)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    # Esta ruta indica que todo el tráfico (0.0.0.0/0) debe ir al Internet Gateway
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.name_prefix}-public-route-table"
  }
}

# 🔗 Asociación: conecta la tabla de ruteo con la subnet pública
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id      # ← ID generado automáticamente
  route_table_id = aws_route_table.public.id   # ← también generado por Terraform
}

# 🔐 Security Group para permitir acceso SSH desde tu IP
resource "aws_security_group" "ssh_access" {
  name        = "${var.name_prefix}-ssh-sg"
  description = "Permite SSH desde mi IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["186.67.243.215/32"] # Cambia esto por tu IP asignada por tu proveedo, ip pública real
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-ssh-sg"
  }
}

# 🖥️ Instancia EC2 en subnet pública
resource "aws_instance" "web" {
  ami                    = "ami-0c101f26f147fa7fd" # Amazon Linux 2 (us-east-1)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  key_name               = var.key_pair_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}

