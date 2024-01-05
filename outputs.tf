output "keycloak_users_credentials" {
  value = [
    for key, value in nonsensitive(module.oidc.devops_stack_users_passwords) : { "user" = key, "password" = nonsensitive(value) }
  ]
  sensitive = false
}

output "minio_url" {
  value     = module.minio.endpoint
  sensitive = false
}
output "keycloak_url" {
  value = module.keycloak.endpoint
}
output "keycloak_admin_credentials" {
  value     = nonsensitive(module.keycloak.admin_credentials)
  sensitive = false
}

