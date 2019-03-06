variable "env_name" {}

variable "network" {}

variable "region" {}

variable "infra_subnet_range" {}

variable "pas_subnet_range" {}

variable "services_subnet_range" {}

variable "zones" {
  type = "list"
}

variable "project" {}
