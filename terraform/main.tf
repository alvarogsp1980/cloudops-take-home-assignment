resource "azurerm_resource_group" "copperleaf" {
  name     = var.resource_group
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "sta" {
  name                      = var.sta_name
  resource_group_name       = azurerm_resource_group.copperleaf.name
  location                  = var.location == "" ? azurerm_resource_group.copperleaf.location : var.location
  account_kind              = var.sta_account_kind
  account_tier              = var.sta_account_tier
  account_replication_type  = var.sta_account_replication_type
  enable_https_traffic_only = var.sta_enable_https_traffic_only 

  static_website {
    index_document = var.sta_static_website_index_document
  }

  tags = var.tags
}

resource "azurerm_storage_blob" "website" {
  for_each               = var.sta_blobs
  name                   = each.value.sta_blob_name
  storage_account_name   = azurerm_storage_account.sta.name
  storage_container_name = each.value.sta_storage_container_name
  type                   = each.value.sta_blob_type
  content_type           = each.value.sta_blob_content_type
  source                 = each.value.sta_blob_source
}