variable "aks_name" {
  type        = string
  description = "The name of the Managed Kubernetes Cluster to create. "
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. "
  default     = ""
}

variable "location" {
  type        = string
  description = "The location where the Managed Kubernetes Cluster should be created."
  default     = ""
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster."
  default     = ""
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false."
  default     = false
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time"
  default     = ""
}

variable "vnet_subnet_id" {
  type        = string
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist."
  default     = ""
}

variable "network_profile" {
  type        = any
  description = "Block of network profile consists of network_plugin, network_mode, network_policy, dns_service_ip, network_plugin_mode, outbound_type, service_cidr, load_balancer_sku"
  default     = {}
}

variable "identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both). "
  default     = ""
}

variable "default_node_pool" {
  type        = any
  description = "Block default node pool"
  default     = {}
}

variable "node_pool" {
  type        = map(any)
  description = "Block default node pool"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
