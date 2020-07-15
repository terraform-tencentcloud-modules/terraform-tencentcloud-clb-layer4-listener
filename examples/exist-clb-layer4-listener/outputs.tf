output "listener_id" {
  description = "Id of CLB listener."
  value       = module.clb-listener.listener_id
}

output "listener_name" {
  description = "Name of the CLB listener."
  value       = module.clb-listener.listener_name
}

output "backend_instances" {
  description = "Information of the backends to be attached."
  value       = module.clb-listener.backend_instances
}