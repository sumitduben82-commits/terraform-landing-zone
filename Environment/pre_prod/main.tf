module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  RGs    = var.RGs
}

module "virtual_network" {
  source     = "../../child_module/azurerm_virtual_network"
  VNETs      = var.VNETs
  depends_on = [module.resource_group]
}

module "subnets" {
  source     = "../../child_module/azurerm_subnet"
  SNETs      = var.SNETs
  depends_on = [module.virtual_network]
}

module "public-ip" {
  source     = "../../child_module/azurerm_public_ip"
  PIPs       = var.PIPs
  depends_on = [module.resource_group]
}

module "virtula_machine" {
  source     = "../../child_module/azurerm_virtual_machine"
  VMs        = var.VMs
  depends_on = [module.public-ip, module.subnets]
}