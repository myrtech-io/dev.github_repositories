locals {
  repositories = yamldecode(file("../repositories.yaml")).repositories
}

resource "github_repository" "myrtech-io-repos" {
  for_each = { for repo in local.repositories : repo.name => repo }

  name        = "${each.value.name}"
  description = each.value.description
  visibility  = "public"
}

# resource "github_team" "folder_structure" {
#   for_each = { for repo in local.repositories : repo.folder => repo if repo.folder != null }

#   name        = each.key
#   description = "Team for repositories in folder ${each.key}"
# }

# resource "github_team_repository" "team_repos" {
#   for_each = { for repo in local.repositories : repo.name => repo if repo.folder != null }

#   team_id    = github_team.folder_structure[each.value.folder].id
#   repository = github_repository.myrtech-io-repos[each.value.name].name
# }