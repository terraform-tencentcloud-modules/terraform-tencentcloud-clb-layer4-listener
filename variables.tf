variable "region" {
  description = "TencentCloud region to launch resources."
  default     = ""
}

# clb instance variables
variable "clb_id" {
  description = "Id of the CLB."
  type        = string
}

# clb-listener variables
variable "listener_name" {
  description = "Name of the CLB listener, and available values can only be Chinese characters, English letters, numbers, underscore and hyphen '-'."
  type        = string
  default     = "tf-modules-clb-listener"
}

variable "port" {
  description = "Port of the CLB listener."
  type        = number
  default     = null
}

variable "protocol" {
  type        = string
  description = "Type of protocol within the listener, and available values are 'TCP', 'UDP', 'HTTP', 'HTTPS' and 'TCP_SSL'."
}

