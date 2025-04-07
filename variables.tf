# 🌍 Región de AWS
variable "region" {
  description = "Región donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

# 🧱 CIDR de la VPC
variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# 🌐 CIDR de la subnet pública
variable "public_subnet_cidr" {
  description = "CIDR block para la subnet pública"
  type        = string
  default     = "10.0.1.0/24"
}

# 🔒 CIDR de la subnet privada
variable "private_subnet_cidr" {
  description = "CIDR block para la subnet privada"
  type        = string
  default     = "10.0.2.0/24"
}

# 🏷️ Prefijo para nombres
variable "name_prefix" {
  description = "Prefijo para nombrar recursos"
  type        = string
  default     = "priscila"
}

# 🔑 Nombre del key pair para acceso SSH a la instancia EC2
variable "key_pair_name" {
  description = "Nombre del key pair existente en AWS para conectarse por SSH"
  type        = string
  default     = "priscila-key"  # ← Reemplaza esto por el nombre real de tu key pair
}
