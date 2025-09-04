variable "zone" {
  type        = string
  description = "The GCP zone to deploy the VM in."
  default     = "us-central1-a"
}

variable "project_id" {
    type = string
    description = "Name of the GCO project to deploy resources in"
    default = "tcscesarjg"
}

variable "static_ip" {
  description = "The number of static IPs to create."
  type        = bool
  default     = false
}