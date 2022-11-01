output "app_url" {
  value = [for ip in azurerm_public_ip.main : "http://${ip.fqdn}:${var.app_port_number}"]
}