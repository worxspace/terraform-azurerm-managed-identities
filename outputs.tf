
output "name" {
    value = azurerm_user_assigned_identity.identity.name
    description = "The name of the user assigned managed identity"
}

output "principal-id" {
    value = azurerm_user_assigned_identity.identity.principal_id
    description = "The principal id of the user assigned managed identity"
}

output "client-id" {
    value = azurerm_user_assigned_identity.identity.client_id
    description = "The client id of the user assigned managed identity"
}

output "identity-resource-id" {
    value = azurerm_user_assigned_identity.identity.id
    description = "The resource id of the user assigned managed identity"
}