# TencentCloud CLB Layer4 Listener Module for Terraform

## terraform-tencentcloud-clb-layer4-listener

A terraform module used to create TencentCloud CLB layer4 listener and CLB attachment.

The following resources are included.

* [CLB Listener](https://www.terraform.io/docs/providers/tencentcloud/r/clb_listener.html)
* [CLB Attachment](https://www.terraform.io/docs/providers/tencentcloud/r/clb_attachment.html)

## Usage

```hcl
module "clb-listener" {
  source = "../../../terraform-tencentcloud-clb-layer4-listener"

  clb_id        = module.clb-instance.clb_id
  listener_name = "tf-clb-listener-module"
  port          = 80
  protocol      = "TCP"
  backend_instances = [
    {
      instance_id = "ins-xxxxxxxx"
      port        = 8899
      weight      = 50
    },
    {
      instance_id = "ins-xxxxxxxx"
      port        = 8900
      weight      = 50
    }
  ]
}
```

## Conditional Creation

This module can create CLB listener.
It is possible to use existing CLB listener when specify `listener_id` parameter.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| protocol | Type of protocol within the listener, and available values are 'TCP' and 'UDP'. | string | null | no 
| health_check_switch | Indicates whether health check is enabled. | bool | false | no 
| health_check_health_num | Health threshold of health check, and the default is 3. If a success result is returned for the health check for 3 consecutive times, the backend CVM is identified as healthy. The value range is 2-10. | number | 3 | no 
| health_check_unhealth_num | Unhealthy threshold of health check, and the default is 3. If a success result is returned for the health check 3 consecutive times, the CVM is identified as unhealthy. The value range is 2-10. | number | 3 | no 
| session_expire_time | Time of session persistence within the CLB listener. NOTES: Available when scheduler is specified as 'WRR'. | number | null | no 
| backend_instances | Information of the backends to be attached. if omitted, will create CLB listener only without the attachment. | list | [] | no 
| region | TencentCloud region to launch resources. | string |  | no 
| port | Port of the CLB listener. | number | null | no 
| listener_id | Id of the CLB listener | string |  | no 
| health_check_time_out | Response timeout of health check. The value range is 2-60 sec, and the default is 2 sec. Response timeout needs to be less than check interval. | number | 2 | no 
| clb_id | Id of the CLB. | string |  | yes 
| listener_name | Name of the CLB listener, and available values can only be Chinese characters, English letters, numbers, underscore and hyphen '-'. | string | tf-modules-clb-listener | no 
| health_check_interval_time | Interval time of health check. The value range is 5-300 sec, and the default is 5 sec. | number | 5 | no 
| scheduler | Scheduling method of the CLB listener, and available values are 'WRR' and 'LEAST_CONN'. The default is 'WRR'. | string | WRR | no 


## Outputs

| Name | Description |
|------|-------------|
| listener_name | Name of the CLB listener. |
| port | Port of the CLB listener. |
| health_check_switch | Indicates whether health check is enabled. |
| health_check_time_out | Response timeout of health check. |
| health_check_interval_time | Interval time of health check. |
| health_check_unhealth_num | Unhealthy threshold of health check |
| listener_id | Id of CLB listener. |
| protocol | Type of protocol within the listener. |
| health_check_health_num | Health threshold of health check. |
| session_expire_time | Time of session persistence within the CLB listener. |
| scheduler | Scheduling method of the CLB listener |
| backend_instances | Information of the backends to be attached. |
| clb_id | Id of CLB instance. |

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details. 