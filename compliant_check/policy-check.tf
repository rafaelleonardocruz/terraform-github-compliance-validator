data "github_repositories" "repos" {
  query = "org:${var.organization_name}"
}

resource "github_branch_protection" "this" {
  count = length(data.github_repositories.repos.names)

  repository     = data.github_repositories.repos.names[count.index]
  branch         = "master"
  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }

}
