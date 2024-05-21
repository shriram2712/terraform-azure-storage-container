variable "prefix" {
  type        = string
  description = "Name prefix used for resources"
}

# Provider
# --------
variable "location" {
  type        = string
  description = "Azure location name e.g. East US"
  default = "East US"
}

variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  default = "Terraform-POC-resources"
}

# Storage Account
# ---------------
variable "storage_account_name" {
  type        = string
  description = "Storage account name"
  default = "test-storage-account"
}

variable "storage_account_container_name" {
  type        = string
  description = "Storage account container name"
  default = "test-storage-container"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier Standard or Premium"
  default = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage account type LRS, GRS, RAGRS, ZRS. NOTE: This is defaulted to 'GRS' because of a known intermittent error sited here: https://github.com/hashicorp/terraform-provider-azurerm/issues/5299."
  default     = "LRS"
  validation {
    condition = (
      var.storage_account_replication_type == "LRS" ||
      var.storage_account_replication_type == "GRS" ||
      var.storage_account_replication_type == "RAGRS" ||
      var.storage_account_replication_type == "ZRS" ||
      var.storage_account_replication_type == null
    )

    error_message = "Supported values for storage_account_replication_type are 'LRS', 'GRS', 'RAGRS', and 'ZRS'."
  }
}
