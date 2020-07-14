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
variable "listener_id" {
  description = "Id of the CLB listener"
  type        = string
  default     = ""
}

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
  description = "Type of protocol within the listener, and available values are 'TCP' and 'UDP'."
  default     = null
}

variable "health_check_time_out" {
  type        = number
  description = "Response timeout of health check. The value range is 2-60 sec, and the default is 2 sec. Response timeout needs to be less than check interval."
  default     = 2
}

variable "health_check_interval_time" {
  type        = number
  description = "Interval time of health check. The value range is 5-300 sec, and the default is 5 sec."
  default     = 5
}

variable "health_check_health_num" {
  type        = number
  description = "Health threshold of health check, and the default is 3. If a success result is returned for the health check for 3 consecutive times, the backend CVM is identified as healthy. The value range is 2-10."
  default     = 3
}

variable "health_check_unhealth_num" {
  type        = number
  description = "Unhealthy threshold of health check, and the default is 3. If a success result is returned for the health check 3 consecutive times, the CVM is identified as unhealthy. The value range is 2-10."
  default     = 3
}

variable "session_expire_time" {
  type        = number
  description = "Time of session persistence within the CLB listener. NOTES: Available when scheduler is specified as 'WRR'."
  default     = null
}

variable "scheduler" {
  type        = string
  description = "Scheduling method of the CLB listener, and available values are 'WRR' and 'LEAST_CONN'. The default is 'WRR'."
  default     = "WRR"
}

# clb-attachment variables
variable "backend_instances" {
  type = list(object({
    instance_id = string
    port        = number
    weight      = number
  }))
  description = "Information of the backends to be attached. if omitted, will create CLB listener only without the attachment."
  default     = []
}