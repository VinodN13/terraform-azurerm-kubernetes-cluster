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

variable "network_plugin" {
  type        = string
  description = "Network plugin to use for networking. Currently supported values are azure, kubenet and none. "
  default     = ""
}

variable "network_policy" {
  type        = string
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure."
  default     = ""
}

variable "dns_service_ip" {
  type        = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). "
  default     = ""
}

variable "outbound_type" {
  type        = string
  description = "The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer, userDefinedRouting, managedNATGateway and userAssignedNATGateway. Defaults to loadBalancer. "
  default     = ""
}

variable "service_cidr" {
  type        = string
  description = "The Network Range used by the Kubernetes service. "
  default     = ""
}

variable "load_balancer_sku" {
  type        = string
  description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard. "
  default     = ""
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
