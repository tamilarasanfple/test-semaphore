output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.this.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "instance_public_ip" {
  description = "Elastic IP attached to the instance"
  value       = aws_eip.this.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.merchant_sg.id
}

output "root_volume_id" {
  description = "Root volume ID"
  value       = aws_instance.this.root_block_device[0].volume_id
}
