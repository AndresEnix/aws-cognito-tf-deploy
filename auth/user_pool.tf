resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.user_pool_name}"
  
  tags = {
    "Name" = "${var.user_pool_name}"
    "SampleTag" = "Sample Value"
  }
}

resource "aws_cognito_user_pool_domain" "domain_name" {
  domain       = "${var.user_pool_donain_name}"
  user_pool_id = "${aws_cognito_user_pool.user_pool.id}"
}
