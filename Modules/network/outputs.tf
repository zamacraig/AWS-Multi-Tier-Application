output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.app_vpc.id
}

output "public_subnet_ids" {
  description = "The ID of the public subnets"
  value       = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}

output "private_subnet_ids" {
  description = "The ID of the private subnets"
  value       = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
}

output "public_subnet_a_id" {
  description = "The ID of the public subnet A"
  value       = aws_subnet.public_subnet_a.id
}

output "public_subnet_b_id" {
  description = "The ID of the public subnet B"
  value       = aws_subnet.public_subnet_b.id
}

output "private_subnet_a_id" {
  description = "The ID of the private subnet A"
  value       = aws_subnet.private_subnet_a.id
}

output "private_subnet_b_id" {
  description = "The ID of the private subnet B"
  value       = aws_subnet.private_subnet_b.id
}

output "private_security_group_id" {
  description = "The private ID of the security group"
  value       = aws_security_group.sg_private.id
}

output "public_security_group_id" {
  description = "The public ID of the security group"
  value       = aws_security_group.sg_public.id
}
