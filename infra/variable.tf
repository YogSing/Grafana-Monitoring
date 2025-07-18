variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "dashboard-rg"
}

variable "location" {
  description = "Location of the resource group"
  type        = string
  default     = "Canada Central"

}

variable "container_app_name" {
  description = "Name of the container app"
  type        = string
  default     = "dashboard-container-app"

}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
}

Variable for your Subscription ID 
