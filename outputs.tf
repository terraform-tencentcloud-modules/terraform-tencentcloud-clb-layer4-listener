# clb outputs
output "clb_id" {
  description = "Id of CLB instance."
  value       = local.clb_id
}

# clb listener outputs
output "listener_id" {
  description = "Id of CLB listener."
  value       = local.listener_id
}

output "listener_name" {
  description = "Name of the CLB listener."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].listener_name : ""
}

output "port" {
  description = "Port of the CLB listener."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].port : null
}

output "protocol" {
  description = "Type of protocol within the listener."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].protocol : ""
}

output "health_check_switch" {
  description = "Indicates whether health check is enabled."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].health_check_switch : ""
}

output "health_check_time_out" {
  description = "Response timeout of health check."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].health_check_time_out : ""
}
output "health_check_interval_time" {
  description = "Interval time of health check."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].health_check_interval_time : ""
}

output "health_check_health_num" {
  description = "Health threshold of health check."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].health_check_health_num : ""
}

output "health_check_unhealth_num" {
  description = "Unhealthy threshold of health check"
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].health_check_unhealth_num : ""
}

output "session_expire_time" {
  description = "Time of session persistence within the CLB listener."
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].session_expire_time : ""
}

output "scheduler" {
  description = "Scheduling method of the CLB listener"
  value       = length(local.this_listener_info) > 0 ? local.this_listener_info[0].scheduler : ""
}

# attachment outputs
output "backend_instances" {
  description = "Information of the backends to be attached."
  value       = length(local.targets) > 0 ? local.backend_instances_read : []
}