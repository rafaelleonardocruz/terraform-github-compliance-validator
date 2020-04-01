provider "github" {
  version      = "~> 2.5"
  token        = var.github_token
  organization = var.organization_name
}

