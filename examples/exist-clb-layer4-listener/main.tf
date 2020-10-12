module "clb-layer4-listener" {
  source = "terraform-tencentcloud-modules/clb-layer4-listener/tencentcloud"

  clb_id      = "lb-85u7q77s"
  listener_id = "lbl-jf89ory8"
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