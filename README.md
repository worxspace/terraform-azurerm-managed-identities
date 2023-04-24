# tfm-azure-managed-identity

Creates user assigned managed identity and grants it permissions to Azure AD Applications.

We use azurecaf\_name to generate a unique name for the user assigned identity.
so make sure to provide the project-name and prefixes as necessary

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >=2.37.2 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | 2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.53.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.53.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app-permission"></a> [app-permission](#module\_app-permission) | ./app-permission | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.identity-name](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/resources/name) | resource |
| [azurerm_role_assignment.identity-assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | value for the location of the user assigned identity | `string` | `"switzerlandnorth"` | no |
| <a name="input_managed-identity-assigner-object-id"></a> [managed-identity-assigner-object-id](#input\_managed-identity-assigner-object-id) | object id of the principal that will be assigned the Managed Identity Operator role on the user assigned identity | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | list of permissions to be granted to the user assigned identity | <pre>list(object({<br>    app-id = string<br>    roles  = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project-name"></a> [project-name](#input\_project-name) | used as the main part of the name of the user assigned identity | `string` | n/a | yes |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | resource group where you want to create the user assigned identity | `string` | n/a | yes |
| <a name="input_resource-name-prefixes"></a> [resource-name-prefixes](#input\_resource-name-prefixes) | value for the prefixes of the user assigned identity | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client-id"></a> [client-id](#output\_client-id) | The client id of the user assigned managed identity |
| <a name="output_identity-resource-id"></a> [identity-resource-id](#output\_identity-resource-id) | The resource id of the user assigned managed identity |
| <a name="output_name"></a> [name](#output\_name) | The name of the user assigned managed identity |
| <a name="output_principal-id"></a> [principal-id](#output\_principal-id) | The principal id of the user assigned managed identity |
