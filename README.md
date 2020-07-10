# TencentCloud CLB listener Module for Terraform

## terraform-tencentcloud-clb-listener

A terraform module used to create TencentCloud CLB listener.

The following resources are included.

* [CLB Listener](https://www.terraform.io/docs/providers/tencentcloud/r/clb_listener.html)

## Usage

```hcl
module "clb-listener" {
  source        = "../../../terraform-tencentcloud-clb-listener"

  clb_id        = module.clb-instance.clb_id
  listener_name = "tf-clb-listener-module"
  port          = 80
  protocol      = "TCP"
}
```

## Conditional Creation

This module can create CLB listener.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| port | Port of the CLB listener. | number | null | no 
| protocol | Type of protocol within the listener, and available values are 'TCP', 'UDP', 'HTTP', 'HTTPS' and 'TCP_SSL'. | string |  | no 
| region | TencentCloud region to launch resources. | string |  | no 
| clb_id | Id of the CLB. | string |  | no 
| listener_name | Name of the CLB listener, and available values can only be Chinese characters, English letters, numbers, underscore and hyphen '-'. | string | tf-modules-clb-listener | no 


## Outputs

| Name | Description |
|------|-------------|
| clb_listener_id | Id of CLB listener. |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details. 