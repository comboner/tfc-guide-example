provider "azurerm" {
  client_id     = $AZURE_ACCESS_KEY_ID
  client_secret = $AZURE_ACCESS_SECRET
  tenant_id     = $AZURE_TENANT_ID
  features {}
}

resource "azurerm_resource_group" "tf_main_test" {
  name     = "tf_resource"
  location = "West Europe"
}
