# configurer le provider azuread
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "rg-asr242-teacher"
    storage_account_name = "sthwuthiu9k4zwo0rfmj"
    container_name       = "tfstates"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "azurerm_resource_group" "main" {
  name = "rg-asr242-teacher"
}

resource "azurerm_container_group" "cg1" {
  name                = "ci-asr242-teacher"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  ip_address_type     = "Public"
  dns_name_label      = "ci-asr242-teacher"
  os_type             = "Linux"
  image_registry_credential {
    server   = "acrasr242teacher.azurecr.io"
    username = "acrasr242teacher"
    password = "jfhjfzCrs5vo5j1P5BsxRvVep33OM3+Ogy8pUdlKyu+ACRB284sY"
  }

  container {
    name   = "nginx"
    image  = "acrasr242teacher.azurecr.io/nginx:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}

resource "azurerm_service_plan" "main" {
  name                = "asp-asr242-teacher"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp1" {
  name                = "web-asr242-teacher"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {}
}