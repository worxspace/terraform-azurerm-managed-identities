data "azuread_service_principal" "app" {
  application_id = var.app-id
}

resource "azuread_app_role_assignment" "roleassignment" {
  for_each = toset(var.roles)

  app_role_id         = data.azuread_service_principal.app.app_roles[index(data.azuread_service_principal.app.app_roles.*.value, each.value)].id
  principal_object_id = var.identity-principal-id
  resource_object_id  = data.azuread_service_principal.app.object_id
}
