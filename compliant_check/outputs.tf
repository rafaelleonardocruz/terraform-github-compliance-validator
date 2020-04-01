data "github_repository" "this" {
  count = length(data.github_repositories.repos.names)

  full_name = data.github_repositories.repos.full_names[count.index]
}

output "public_repositories" {
  description = "List of repositories publicly exposed"

  value = [ for repo in data.github_repository.this : repo.name if repo.private != "true" ]

}
