output "website_url" {
  description = "The endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.sta.primary_web_endpoint
}