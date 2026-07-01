variable "resource_group_name" {
  type    = string
  default = "rg-poc17-free"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-poc17-free"
}

variable "app_service_name" {
  type    = string
  default = "webapp-poc17-unique-name" # Change this to be globally unique
}
