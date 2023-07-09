variable "resource-group-name" {
  type        = string
  description = "resource group where you want to create the user assigned identity"
}

variable "location" {
  type        = string
  default     = "switzerlandnorth"
  description = "value for the location of the user assigned identity"
}

variable "project-name" {
  type        = string
  description = "used as the main part of the name of the user assigned identity"
}

variable "resource-name-prefixes" {
  type        = list(string)
  default     = []
  description = "value for the prefixes of the user assigned identity"
}

variable "managed-identity-assigner-object-id" {
  type        = string
  description = "object id of the principal that will be assigned the Managed Identity Operator role on the user assigned identity"
}

variable "permissions" {
  type = list(object({
    app-id = string
    roles  = list(string)
  }))

  default     = []
  description = "list of permissions to be granted to the user assigned identity"
}

variable "directory-roles" {
  type        = list(string)
  default     = []
  description = "list of directory roles to be assigned to the user assigned identity"
}

variable "azure-resource-permissions" {
  type = list(object({
    scope = string
    role  = string
  }))
  default = []
  description = "list of azure rbac permissions to grant to the user assigned identity"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "tags to be applied to the user assigned identity"
}
