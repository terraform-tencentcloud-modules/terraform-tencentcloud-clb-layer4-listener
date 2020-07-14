# CLB Module Example

This module will create a new CLB attachment instance using existing CLB instance and CLB listener.

## Usage

To run this example, you need first replace the configuration like `clb_id`, `listener_id` and `backend_instances`, then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note, this example may create resources which cost money. Run `terraform destroy` if you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| listener_id | Id of CLB listener.   |
| listener_name | Name of the CLB listener. |
| backend_instances | Information of the backends to be attached. |