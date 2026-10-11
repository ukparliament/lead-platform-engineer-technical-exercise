variable "location" {
  description = "Azure region for the portal resources."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource group containing the portal infrastructure."
  type        = string
  default     = "rg-team-portal"
}

variable "app_name" {
  description = "Globally unique name for the portal web app."
  type        = string
  default     = "team-portal-demo"
}

variable "storage_account_name" {
  description = "Globally unique name for the portal storage account."
  type        = string
  default     = "stteamportaldemo"
}