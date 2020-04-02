resource "aws_cognito_user_pool_client" "client" {
  name = "${var.client_name}"

  user_pool_id = "${aws_cognito_user_pool.user_pool.id}"

  generate_secret     = true
  explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH"]
  allowed_oauth_flows = ["client_credentials"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes = ["https://example.com/create-example","https://example.com/delete-example","https://example.com/get-example"]
  refresh_token_validity = 1
}

resource "null_resource" "test_client" {
  provisioner "local-exec" {
    command = <<EOT
                node ./generateToken.js "https://${aws_cognito_user_pool_domain.domain_name.domain}.auth.${var.region}.amazoncognito.com/" "${aws_cognito_user_pool_client.client.id}" "${aws_cognito_user_pool_client.client.client_secret}"
              EOT
  }
}