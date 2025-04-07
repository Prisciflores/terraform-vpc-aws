# 📤 Muestra el ID de la VPC
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

# 📤 Muestra el ID de la subnet pública
output "public_subnet_id" {
  description = "ID de la subnet pública"
  value       = aws_subnet.public.id
}

# 📤 Muestra el ID de la subnet privada
output "private_subnet_id" {
  description = "ID de la subnet privada"
  value       = aws_subnet.private.id
}

# 📤 Muestra el ID del Internet Gateway
output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# 📤 Muestra el ID de la tabla de ruteo pública
output "public_route_table_id" {
  description = "ID de la tabla de ruteo pública"
  value       = aws_route_table.public.id
}

output "ec2_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web.public_ip
}
