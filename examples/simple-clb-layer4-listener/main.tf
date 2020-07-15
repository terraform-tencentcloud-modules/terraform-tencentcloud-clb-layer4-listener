provider "tencentcloud" {
  region = "ap-guangzhou"
}

module "clb-instance" {
  source = "../../../terraform-tencentcloud-clb"

  network_type = "INTERNAL"
  clb_name     = "tf-clb-module-internal"
  vpc_id       = "vpc-xxxxxxxx"
  subnet_id    = "subnet-xxxxxxxx"
  project_id   = 0

  clb_tags = {
    test = "tf-clb-module"
  }
}

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