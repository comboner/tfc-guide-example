provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" {
  name     = "prefix-resources"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "main" {
  name                = "prefix-asp"
  location            = "West Europe"
  resource_group_name = "tf_test"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "prefix-appservice"
  location            = "West Europe"
  resource_group_name = "tf_test"
  app_service_plan_id = "someid"

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|appsvcsample/python-helloworld:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
  }
}