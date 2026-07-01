terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {} 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Free Tier App Service Plan configured for Linux
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux" # Changed from Windows
  sku_name            = "F1"    # Completely FREE tier
}

# Linux Web App configuration
resource "azurerm_linux_web_app" "app" { # Changed to linux_web_app
  name                = var.app_service_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = false # Required to be false for Free Tier
    # Configured to host basic HTML/JS files natively
    application_stack {
      node_version = "18-lts" 
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}

resource "azurerm_application_insights" "app_insights" {
  name                = "insights-poc17"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}
