/**
 * # tfm-azure-managed-identities
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

  tags = var.tags
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

module "directory-role" {
  source = "./directory-role"

  for_each = { for assignment in var.directory-roles : assignment => assignment }

  diectory-role = each.value
  object-id     = azurerm_user_assigned_identity.identity.principal_id
}


resource "azurerm_role_assignment" "azure-rbac" {
  for_each = { for assignment in var.azure-resource-permissions: "${uuidv5("743ac3c0-3bf7-4a5b-9e6c-59360447c757", assignment.scope)}-${assignment.role}" => assignment }
  
  scope                = each.value.scope
  role_definition_name = each.value.role
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}