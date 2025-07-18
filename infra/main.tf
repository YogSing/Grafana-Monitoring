resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace_id" {
  name                = "azurerm-log-analytics-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  retention_in_days = 30
  sku               = "PerGB2018"
}

resource "azurerm_container_app_environment" "app_environment" {
  name                       = "Website-Environment"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace_id.id
}



resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.app_environment.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  ingress {
    allow_insecure_connections = true
    external_enabled           = true
    target_port                = 80
    traffic_weight {
      latest_revision = "true"
      percentage      = 100
    }
  }

  template {
    container {
      name   = "my docker Image"
      image  = "my docker image for contianer app"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

}

resource "azurerm_dashboard_grafana" "data_dashboard_grafana" {
  name                              = "grafana-dashboard"
  resource_group_name               = azurerm_resource_group.rg.name
  location                          = azurerm_resource_group.rg.location
  grafana_major_version             = 11
  api_key_enabled                   = true
  deterministic_outbound_ip_enabled = true
  public_network_access_enabled     = true

  identity {
    type = "SystemAssigned"
  }

  tags = {
    key = "value"
  }
}

resource "azurerm_role_assignment" "grafana_log_analytics_access" {
  scope                = azurerm_log_analytics_workspace.log_analytics_workspace_id.id
  role_definition_name = "Monitoring Reader"
  principal_id         = azurerm_dashboard_grafana.data_dashboard_grafana.identity[0].principal_id
}
