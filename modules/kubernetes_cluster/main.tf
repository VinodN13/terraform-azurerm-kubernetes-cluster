resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.aks_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled
  kubernetes_version      = var.kubernetes_version

  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    content {
      name                 = default_node_pool.value.name
      vm_size              = default_node_pool.value.vm_size
      enable_auto_scaling  = default_node_pool.value.enable_auto_scaling
      max_count            = default_node_pool.value.max_count
      min_count            = default_node_pool.value.min_count
      node_count           = default_node_pool.value.node_count
      vnet_subnet_id       = var.vnet_subnet_id
      max_pods             = default_node_pool.value.max_pods
      node_labels          = default_node_pool.value.node_labels
      os_disk_size_gb      = default_node_pool.value.os_disk_size_gb
      os_disk_type         = lookup(default_node_pool.value, "os_disk_type", "Managed")
      os_sku               = lookup(default_node_pool.value, "os_sku", "Ubuntu")
      scale_down_mode      = lookup(default_node_pool.value, "scale_down_mode", "Delete")
      type                 = lookup(default_node_pool.value, "type", "VirtualMachineScaleSets")
      orchestrator_version = default_node_pool.value.kubernetes_version
    }
  }

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      network_plugin      = network_profile.value.network_plugin
      network_mode        = network_profile.value.network_mode
      network_policy      = network_profile.value.network_policy
      dns_service_ip      = network_profile.value.dns_service_ip
      network_plugin_mode = network_profile.value.network_plugin_mode
      outbound_type       = lookup(network_profile.value, "outbound_type", "loadBalancer")
      service_cidr        = network_profile.value.service_cidr
      service_cidrs       = lookup(default_node_pool.value, "service_cidrs", [])
      load_balancer_sku   = lookup(network_profile.value, "load_balancer_sku", "standard")
    }
  }

  identity {
    type = var.identity_type
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  for_each              = var.node_pool
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = each.value["name"]
  vm_size               = each.value["vm_size"]
  enable_auto_scaling   = each.value["enable_auto_scaling"]
  max_count             = each.value["max_count"]
  min_count             = each.value["min_count"]
  node_count            = each.value["node_count"]
  vnet_subnet_id        = var.vnet_subnet_id
  max_pods              = each.value["max_pods"]
  mode                  = try(each.value["mode"], "User")
  node_labels           = each.value["node_labels"]
  os_disk_size_gb       = each.value["os_disk_size_gb"]
  os_disk_type          = try(each.value["os_disk_type"], "Managed")
  os_sku                = try(each.value["os_sku"], "Ubuntu")
  os_type               = try(each.value["os_type"], "Linux")
  priority              = try(each.value["priority"], "Regular")
  scale_down_mode       = try(each.value["scale_down_mode"], "Delete")
  orchestrator_version  = each.value["kubernetes_version"]

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}
