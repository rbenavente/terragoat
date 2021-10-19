resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "c8c3451e-221e-43de-97b8-924210b3fd1b"
  }
}