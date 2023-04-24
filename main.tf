/**
 * # tfm-azure-managed-identity
 *
 * Creates user assigned managed identity and grants it permissions to Azure AD Applications.
 *
 * We use azurecaf_name to generate a unique name for the user assigned identity.
 * so make sure to provide the project-name and prefixes as necessary
 */

resource "azurecaf_name" "identity-name" {
  resource_type = "general"
  name          = var.project-name
  prefixes      = concat(var.resource-name-prefixes, ["mi"])
}

resource "azurerm_user_assigned_identity" "identity" {
  name = azurecaf_name.identity-name.result

  resource_group_name = var.resource-group-name
  location            = var.location
}

resource "azurerm_role_assignment" "identity-assignment" {
  scope                = azurerm_user_assigned_identity.identity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.managed-identity-assigner-object-id
}

module "app-permission" {
  source = "./app-permission"

  for_each = { for perm in var.permissions : perm.app-id => perm }

  app-id                = each.value.app-id
  roles                 = each.value.roles
  identity-principal-id = azurerm_user_assigned_identity.identity.principal_id
}
