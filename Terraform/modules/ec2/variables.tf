variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "ami_id" {
  description = "AMI ID to launch the instance with"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t4g.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "Whether to assign a public IP address"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "User data script to run on EC2 launch"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags to attach to the instance"
  type        = map(string)
  default     = {}
}
