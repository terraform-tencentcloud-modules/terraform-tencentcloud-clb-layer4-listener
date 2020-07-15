provider "tencentcloud" {
  region = "ap-guangzhou"
}

module "clb-listener" {
  source = "../../../terraform-tencentcloud-clb-layer4-listener"

  clb_id      = "lb-buhw9rpc"
  listener_id = "lbl-ca8l2bak"
  backend_instances = [
    {
      instance_id = "ins-2jukvhb4"
      port        = 8899
      weight      = 50
    },
    {
      instance_id = "ins-52mjbm3u"
      port        = 8900
      weight      = 50
    }
  ]
}