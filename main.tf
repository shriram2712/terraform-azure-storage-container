resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_pet" "random_pet_tfe_storage_account_name" {
  length = 3
  prefix = var.prefix
}

resource "azurerm_storage_account" "tfe_storage_account" {
  # Ensure the name is 24 alphanumeric characters as required by Azure.
  name = substr(
    lower(replace(random_pet.random_pet_tfe_storage_account_name.id, "/[^[:alnum:]]/", "")),
    0,
    24
  )
  location            = var.location
  resource_group_name = azure_resource_group.example.name

  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}

resource "azurerm_storage_container" "storage_account_container" {

  name                  = var.storage_account_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}
