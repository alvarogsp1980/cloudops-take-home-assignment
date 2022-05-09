# Subscription and Tenant variables
variable "subscription_id" {
  type        = string
  description = "(Required) The ID of the Subscription in which the resources are to be created."
  sensitive = true
}
variable "tenant_id" {
  type        = string
  description = "(Required) The ID of the Tenant to which the subscription belongs."
  sensitive = true  
}
variable "client_id" {
  type        = string
  description = "(Required) The client ID of the service principal that will create the resources."
  sensitive = true  
}
variable "client_secret" {
  type        = string
  description = "(Required) The client Secret of the service principal that will create the resources."
  sensitive = true  
}

# Resource group variables
variable "resource_group" {
  type        = string
  description = "(Required) The name of the resource group in which to create the resources. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Optional) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = ""
}

# Storage Account Variables
variable "sta_name" {
  description = " (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group"
  type        = string
}
variable "sta_account_kind" {
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2."
  type        = string
  default     = "StorageV2"
}
variable "sta_account_tier" {
  description = "(Optional) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}
variable "sta_account_replication_type" {
  description = "(Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  type        = string
  default     = "LRS"
}
variable "sta_enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true"
  type        = bool
  default     = true
}
variable "sta_static_website_index_document" {
  description = "(Required) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive."
  type        = string
}

# Storage blob variables
variable "sta_blobs" {
  description = "(Required) One or more blocks to defined each blob content."
  type        = map(any)
}

# Tagging
variable "tags" {
  type        = map(any)
  description = "(Optional) User and common Tags."
  default     = {}
}
