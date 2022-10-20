# env0-ci-example

Example code for a CI process involving env0

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | (Required) Password for the admin user. | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | (Required) Username for the admin user. | `string` | n/a | yes |
| <a name="input_app_port_number"></a> [app\_port\_number](#input\_app\_port\_number) | (Optional) Port number for app. Defaults to 8000. | `number` | `8000` | no |
| <a name="input_app_subnet"></a> [app\_subnet](#input\_app\_subnet) | (Required) Name of subnet for app VM deployment. Must also be in keys from subnet\_map. | `string` | n/a | yes |
| <a name="input_business_unit_tag"></a> [business\_unit\_tag](#input\_business\_unit\_tag) | (Optional) BU tag to apply to all resources. | `string` | `null` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | (Optional) Tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment for Azure resources. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Region for Azure resources, defaults to East US. | `string` | `"eastus"` | no |
| <a name="input_organization_tag"></a> [organization\_tag](#input\_organization\_tag) | (Optional) Org tag to apply to all resources. | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | (Required) Naming prefix for resources. | `string` | n/a | yes |
| <a name="input_subnet_map"></a> [subnet\_map](#input\_subnet\_map) | (Required) Map of subnet names and address spaces. | `map(string)` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | (Optional) VM size for app. Defaults to Standard\_D2s\_v5. | `string` | `"Standard_D2s_v5"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | (Required) Address space for the virtual network. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | n/a |
<!-- END_TF_DOCS -->