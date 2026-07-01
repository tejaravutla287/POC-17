variable "resource_group_name" {
  type    = string
  default = "rg-poc17-free"
}

variable "location" {
  type    = string
  default = "Central US" # Changed from East US (Central/West have better Free Trial quotas)
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-poc17-free"
}

variable "app_service_name" {
  type    = string
  default = "webapp-poc17-bhanu-teja" # Ensure this name is globally unique
}
