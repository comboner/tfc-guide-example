provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf_main_test" {
  name     = "tf_resource"
  location = "West Europe"
}