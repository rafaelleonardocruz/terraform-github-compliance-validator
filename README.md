![Docker-Image-Build-CI](https://github.com/rafaelleonardocruz/terraform-github-compliance-validator/workflows/Docker-Image-Build-CI/badge.svg)
# Terraform Github Compliance Validator

## Description
This project intends can help you to ensure that projects into your organization be following a defined compliance policy.

You can:
- Check repositories publicly exposed
- Check repositories that doesn't follow the defined policy

## Usage
- Build the docker image
```
$ docker build -t terraform-github-compliance-validator:latest .
```
- Run the docker image passing a github token valid into desired org and organization name
```
docker run -it terraform-github-compliance-validator:latest <github token> <organization name>
```

- All repositories listed on `terraform plan` isn't compliance with defined policy. (Ex.:)
```
  + resource "github_branch_protection" "this" {
      + branch                 = "master"
      + enforce_admins         = true
      + etag                   = (known after apply)
      + id                     = (known after apply)
      + repository             = "secret"
      + require_signed_commits = false

      + required_pull_request_reviews {
          + dismiss_stale_reviews           = true
          + required_approving_review_count = 1
        }
    }

  # github_branch_protection.this[1] will be created
  + resource "github_branch_protection" "this" {
      + branch                 = "master"
      + enforce_admins         = true
      + etag                   = (known after apply)
      + id                     = (known after apply)
      + repository             = "project"
      + require_signed_commits = false

      + required_pull_request_reviews {
          + dismiss_stale_reviews           = true
          + required_approving_review_count = 1
        }
    }

  # github_branch_protection.this[2] will be created
  + resource "github_branch_protection" "this" {
      + branch                 = "master"
      + enforce_admins         = true
      + etag                   = (known after apply)
      + id                     = (known after apply)
      + repository             = "back"
      + require_signed_commits = false

      + required_pull_request_reviews {
          + dismiss_stale_reviews           = true
          + required_approving_review_count = 1
        }
    }

  # github_branch_protection.this[3] will be created
  + resource "github_branch_protection" "this" {
      + branch                 = "master"
      + enforce_admins         = true
      + etag                   = (known after apply)
      + id                     = (known after apply)
      + repository             = "front"
      + require_signed_commits = false

      + required_pull_request_reviews {
          + dismiss_stale_reviews           = true
          + required_approving_review_count = 1
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

```
- All repositories listed on `terraform refresh` are public exposed. (Ex.:)
```
Outputs:

public_repositories = [
  "secret",
  "project",
  "back",
  "front",
]
```

## Policy customization
To define your policy,  you need customize the file [compliant_check/policy-check.tf](compliant_check/policy-check.tf) exploring the possibilities offered by [terrafrom github_branch_protection resource](https://www.terraform.io/docs/providers/github/r/branch_protection.html)
