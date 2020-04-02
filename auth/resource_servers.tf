resource "aws_cognito_resource_server" "resource_server" {
  identifier = "https://example.com"
  name       = "example"

  scope {
    scope_name        = "get-example"
    scope_description = "Get Sample Scope"
  }
  scope {
    scope_name        = "create-example"
    scope_description = "Create Sample Scope"
  }
  scope {
    scope_name        = "delete-example"
    scope_description = "Delete Sample Scope"
  }

  user_pool_id = "${aws_cognito_user_pool.user_pool.id}"
}
