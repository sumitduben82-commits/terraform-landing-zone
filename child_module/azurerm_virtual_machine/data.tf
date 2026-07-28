data "azurerm_subnet" "SNETs" {
  for_each             = var.VMs
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "PIPs" {
  for_each            = var.VMs
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}