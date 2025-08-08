variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "name" {
  description = "Name for tagging resources"
  type        = string
}

variable "volume_size" {
  description = "EBS volume size in GB"
  type        = number
}

variable "iam_role_name" {
  description = "IAM role name to associate"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply"
  type        = map(string)
}

variable "hostname" {
  description = "Hostname to assign to the EC2 instance"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}
