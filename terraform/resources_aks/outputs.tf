output "resource_group_name" {
  value    = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value    = azurerm_kubernetes_cluster.k8s.name
}

output "client_certificate" {
   value	= azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
   senstive = true
}

output "client_key" {
   value    = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
   senstive = true
}

output "cluster_ca_certificate" {
   value    = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
   senstive = true
}

output "cluster_username" {
   value    = azurerm_kubernetes_cluster.k8s.kube_config[0].username
   senstive = true
}

output "cluster_password" {
   value    = azurerm_kubernetes_cluster.k8s.kube_config[0].password
   senstive = true
}

output "host" {
   value    = azurerm_kubernetes_cluster.k8s.kube_config[0].host
   senstive = true
}

output "kube_config" {
  value    = azurerm_kubernetes_cluster.k8s.kube_config_raw
  senstive = true
}