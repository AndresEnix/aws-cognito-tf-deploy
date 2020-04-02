provider "aws" {
  profile    = "andres_root"
  region     = "${var.region}"
}

module "auth" {
    source = "./auth/"
    region = "${var.region}"
}