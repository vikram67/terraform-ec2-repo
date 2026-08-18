resource "aws_security_group" "web" {
  name        = "dev-web-sg"
  description = "Security group for the dev EC2 instance"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "dev-web-sg"
    Environment = "dev"
  }
}

module "ec2" {
  source = "../../modules/ec2"

  name       = "dev-web-instance"
  environment = "dev"
  ami_id     = var.ami_id

  instance_type           = "t3.micro"
  subnet_id               = var.subnet_id
  security_group_ids      = [aws_security_group.web.id]
  key_name                = var.key_name
  associate_public_ip_address = true

  tags = {
    Project     = "terraform-demo"
    ManagedBy   = "terraform"
    Environment = "dev"
  }

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Hello from Terraform EC2 module" > /var/www/html/index.html
  EOT
}
