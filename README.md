# Terraform VPC AWS

Este proyecto implementa una infraestructura básica en AWS utilizando Terraform, ideal para entornos de desarrollo y aprendizaje.

### 🔧 ¿Qué se crea?

- Una **VPC personalizada**
- Una **subnet pública**
- Una **subnet privada**
- Un **Internet Gateway** y su tabla de ruteo
- Una **instancia EC2** en la subnet pública (Free Tier)
- Outputs con los IDs e IP pública

---

### 🚀 Tecnologías utilizadas

- **Terraform** como herramienta de IaC
- **AWS** como proveedor cloud
- **Amazon Linux 2023** como AMI base
- Infraestructura desplegada desde **Linux**

---

### 🛡️ Seguridad

- El acceso SSH a la EC2 está restringido mediante un **Security Group** que permite conexiones solo desde una IP específica.
- El nombre del key pair y la IP han sido parametrizados y **no están incluidos en este repositorio por seguridad**.

---

### 💡 Cómo usar este proyecto

1. Clona el repositorio
2. Ajusta las variables necesarias en `variables.tf` o en un archivo `.tfvars`
3. Ejecuta:

```bash
terraform init
terraform plan
terraform apply

### 📁 Estructura del proyecto

```bash

terraform-vpc-aws/
├── main.tf         # Define recursos principales: VPC, subnets, EC2, IGW
├── variables.tf    # Variables parametrizadas (CIDR, key pair, región, etc.)
├── outputs.tf      # Salidas útiles como IP pública e IDs
├── .gitignore      # Archivos ignorados por Git (tfstate, .pem, etc.)
└── README.md       # Documentación del proyecto
```

👩‍💻 Autora
Proyecto realizado por Priscila Flores como parte de su portafolio DevOps.
Este proyecto fue creado desde cero como una práctica de infraestructura en la nube usando buenas prácticas y enfoque seguro.