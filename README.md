# env0-ci-example

Example code for a CI process involving env0

## Introduction

This code is an example of Continuous Integration with Terraform and env0. It is meant as a reference for my Terraform Tuesday YouTube video [Exploring Continuous Integration with Infrastructure as Code](https://youtu.be/PQjs5rDbPbg). If you'd like to take it for a spin yourself, you'll first want to fork this repository and then follow the steps below.

## Prerequisites

You will need a few things to get started:

* A GitHub account
* An env0 account
* An Azure subscription
* A service principal for your Azure subscription
* Python installed locally for pre-commit hooks

## Setup

Once you've forked the repository, you will pull down a local copy. Then you'll set up the pre-commit hook processing. The contents of [.pre-commit-config.yaml](.pre-commit-config.yaml) define the hooks that will run. Use the instructions found on [James Cook's site](https://jamescook.dev/pre-commit-for-terraform) to prepare your machine to leverage the pre-commit hooks.

You'll also need to install the utilities used by the pre-commit hooks:

* terraform-docs
* tfsec
* tflint

The pre-commit hook piece is optional, but I think it's very worthwhile.

The GitHub actions are defined in the .github/workflows directory. You don't need to do anything to get it to work. The workflow will fire on a push to any branch not named `main`.

## env0 Setup

The last piece of the process uses a project and environment defined in env0. Here's what you'll need to configure on the env0 side:

* Create a project
* Create cloud credentials for Azure
* Create a template referencing the contents of this repository
* Create an environment for the template
  * Enable deploy on push and plan on PR
  * Configure values for the variables in the template

When a PR comes in, the environment will run a plan, including the steps defined in the env0.yml file. When the PR is merged, the environment will run a deploy.

Once you've created the environment, run a deploy to get the resources created in Azure.

## Running the demo

You'll start by creating a new branch and making a change to the Terraform code. Then try to commit the change and observe the pre-commit hooks that run. Once they pass, push the branch to GitHub and observer the GitHub Actions workflow. Then open a PR. You'll see the plan run in the PR. Once the PR is merged, you'll see the deploy run in the environment.

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
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | (Optional) Number of VMs to create, defaults to 1. | `number` | `1` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | (Optional) VM size for app. Defaults to Standard\_D2s\_v5. | `string` | `"Standard_D2s_v5"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | (Required) Address space for the virtual network. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | n/a |
<!-- END_TF_DOCS -->