output "storage_account_name" {
  value       = azurerm_storage_account.tfe_storage_account.name
  description = "The name of the storage account used by TFE"
}

output "storage_account_container_name" {
  value       = azurerm_storage_container.storage_account_container.name
  description = "The name of the storage container used by TFE"
}
