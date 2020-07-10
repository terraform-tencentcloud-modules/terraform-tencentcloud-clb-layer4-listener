provider "tencentcloud" {
  version = ">=1.19.0"
  region  = var.region != "" ? var.region : null
}

resource "tencentcloud_clb_listener" "this" {
  clb_id                     = var.clb_id
  listener_name              = var.listener_name
  port                       = var.port
  protocol                   = var.protocol
}
