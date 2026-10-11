resource "azurerm_resource_group" "portal" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    product     = "team-portal"
    environment = "dev"
  }
}

resource "azurerm_service_plan" "portal" {
  name                = "asp-team-portal"
  resource_group_name = azurerm_resource_group.portal.name
  location            = azurerm_resource_group.portal.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_storage_account" "portal" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.portal.name
  location                        = azurerm_resource_group.portal.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = true
}

resource "azurerm_storage_container" "assets" {
  name                  = "assets"
  storage_account_id    = azurerm_storage_account.portal.id
  container_access_type = "blob"
}

resource "azurerm_linux_web_app" "portal" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.portal.name
  location            = azurerm_resource_group.portal.location
  service_plan_id     = azurerm_service_plan.portal.id
  https_only          = true

  site_config {
    always_on  = true
    ftps_state = "Disabled"

    application_stack {
      dotnet_version = "10.0"
    }
  }

  app_settings = {
    ASPNETCORE_ENVIRONMENT    = "Production"
    STORAGE_CONNECTION_STRING = azurerm_storage_account.portal.primary_connection_string
    ASSETS_CONTAINER          = azurerm_storage_container.assets.name
  }
}