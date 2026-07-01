output "webapp_url" {
  value = azurerm_windows_web_app.app.default_hostname
}
