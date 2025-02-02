variable "region" {
  description = "AWS Region"
  type        = string
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
}

variable "subnets" {
  description = "List of subnet IDs for the service"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for the service"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the service"
  type        = bool
}

variable "family" {
  description = "The family of the ECS task definition"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) to allocate for the task"
  type        = string
}

variable "cpu" {
  description = "The number of CPU units to allocate for the task"
  type        = string
}

variable "image" {
  description = "The Docker image to use for the container"
  type        = string
}