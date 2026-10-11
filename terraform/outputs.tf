output "portal_url" {
  description = "HTTPS endpoint for the portal web app."
  value       = "https://${azurerm_linux_web_app.portal.default_hostname}"
}

output "assets_url" {
  description = "Base URL for the portal assets container."
  value       = "${azurerm_storage_account.portal.primary_blob_endpoint}${azurerm_storage_container.assets.name}"
}