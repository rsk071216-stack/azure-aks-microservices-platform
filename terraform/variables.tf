variable "project" {
  description = "Short project name, used as a prefix for all resources."
  type        = string
  default     = "shopdemo"
}

variable "environment" {
  description = "Environment name (dev, prod)."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "centralindia"
}

variable "vnet_cidr" {
  description = "Address space of the virtual network."
  type        = string
  default     = "10.10.0.0/16"
}

variable "aks_subnet_cidr" {
  description = "Subnet for AKS nodes."
  type        = string
  default     = "10.10.1.0/24"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version. null = latest default version in the region."
  type        = string
  default     = null
}

variable "node_vm_size" {
  description = "VM size for the AKS node pool."
  type        = string
  default     = "Standard_B2s"
}

variable "node_min_count" {
  description = "Minimum number of nodes (autoscaler)."
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Maximum number of nodes (autoscaler)."
  type        = number
  default     = 2
}

variable "tags" {
  description = "Extra tags added to every resource."
  type        = map(string)
  default     = {}
}
