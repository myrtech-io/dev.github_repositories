resource "github_repository" "myrtech-io-repos" {
  # for_each = { for repo in local.repositories : repo.name => repo }
  for_each = { for idx, entry in local.flattened_repositories : idx => entry }

  name        = each.value.repo
  description = each.value.description
  visibility  = "public"
}

resource "github_branch_default" "default" {
  # for_each   = { for repo in local.repositories : repo.name => repo }
  for_each = { for idx, entry in local.flattened_repositories : idx => entry }
  repository = github_repository.myrtech-io-repos[each.value].name
  branch     = "master"
}

resource "github_branch_protection" "master_branch_protection" {
  # for_each = flatten([
  #   for repo, config in local.repositories : [
  #     for pattern,value in toset(config.branch_prefixes) : {
  #       repo          = config.name
  #       branch_prefix = value
  #     }
  #   ]
  # ])
  for_each = { for idx, entry in local.flattened_repositories : idx => entry }
  repository_id  = github_repository.myrtech-io-repos[each.value.repo].id
  pattern        = each.value.branch_prefix
  enforce_admins = true
  required_status_checks {
    strict   = false
    contexts = []
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    restrict_dismissals    = true
    dismissal_restrictions = var.main_branch_allowed_users
  }
}