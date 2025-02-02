output "vpc_id" {
    value = module.network.vpc_id
}

#output "instance_ips" {
#   value = module.compute.instance_ips
#}


output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "security_group_id" {
  value = module.network.security_group_id
}