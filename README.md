# TencentCloud CLB Layer4 Listener Module for Terraform

## terraform-tencentcloud-clb-layer4-listener

A terraform module used to create TencentCloud CLB layer4 listener and CLB attachment.

The following resources are included.

* [CLB Listener](https://www.terraform.io/docs/providers/tencentcloud/r/clb_listener.html)
* [CLB Attachment](https://www.terraform.io/docs/providers/tencentcloud/r/clb_attachment.html)

## Usage

```hcl
module "clb-layer4-listener" {
  source = "../../../terraform-tencentcloud-clb-layer4-listener"

  clb_id        = module.clb-instance.clb_id
  listener_name = "tf-clb-listener-module"
  port          = 80
  protocol      = "TCP"
  health_check = {
    health_check_switch        = true
    health_check_time_out      = 2
    health_check_interval_time = 5
    health_check_health_num    = 3
    health_check_unhealth_num  = 3
  }
  backend_instances = [
    {
      instance_id = "ins-hkdom3go"
      port        = 8899
      weight      = 50
    },
    {
      instance_id = "ins-m16vpbkc"
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
| session_expire_time | Time of session persistence within the CLB listener. NOTES: Available when scheduler is specified as 'WRR'. | number | null | no 
| scheduler | Scheduling method of the CLB listener, and available values are 'WRR' and 'LEAST_CONN'. The default is 'WRR'. | string | WRR | no 
| port | Port of the CLB listener. | number | null | no 
| protocol | Type of protocol within the listener, and available values are 'TCP' and 'UDP'. | string | null | no 
| health_check | The CLB layer4 listener health check settings. Supported fields are `health_check_switch`, `health_check_time_out`, `health_check_interval_time`, `health_check_health_num` and `health_check_unhealth_num`. | map | {} | no 
| listener_name | Name of the CLB listener, and available values can only be Chinese characters, English letters, numbers, underscore and hyphen '-'. | string | tf-modules-clb-listener | no 
| backend_instances | Information of the backends to be attached. if omitted, will create CLB listener only without the attachment. | list | [] | no 
| region | TencentCloud region to launch resources. | string |  | no 
| clb_id | Id of the CLB. | string |  | yes 
| listener_id | Id of the CLB listener | string |  | no 

## Outputs

| Name | Description |
|------|-------------|
| backend_instances | Information of the backends to be attached. |
| clb_id | Id of CLB instance. |
| listener_id | Id of CLB listener. |
| listener_name | Name of the CLB listener. |
| port | Port of the CLB listener. |
| protocol | Type of protocol within the listener. |

## Authors

Created and maintained by [TencentCloud](https://github.com/tencentcloudstack/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details. 