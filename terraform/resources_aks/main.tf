data "azurerm_resource_group" "rg" {
  name                              = var.resource_group_name
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {
    prefix= "cluster"
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
    prefix= "dns"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${random_pet.azurerm_kubernetes_cluster_name.id}-aks"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "${random_pet.azurerm_kubernetes_cluster_dns_prefix.id}-k8s"
  kubernetes_version  = "1.26.3"

  default_node_pool {
    name            = "agentpool"
    node_count      = var.node_count
    vm_size         = "Standard_D2s_v3"
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile{
    admin_username = var.username
    ssh_key{
        key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output.publickey)
    }
  }
  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }  
}
