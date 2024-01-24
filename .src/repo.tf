resource "github_repository" "myrtech-io-repos" {
  for_each = { for repo in local.repositories : repo.name => repo }

  name        = each.value.name
  description = each.value.description
  visibility  = "public"
}

# resource "github_branch_protection" "main_branch_protection" {
#   for_each = { for repo in local.repositories : repo.name => repo }

#   repository_id = github_repository.myrtech-io-repos[each.value].name

#   pattern          = "master"
#   enforce_admins   = true
#   allows_deletions = true

#   required_status_checks {
#     strict   = false
#   }

#   required_pull_request_reviews {
#     dismiss_stale_reviews  = true
#     restrict_dismissals    = true
#     dismissal_restrictions = [
#       data.github_user.example.node_id,
#       github_team.example.node_id,
#       "/exampleuser",
#       "exampleorganization/exampleteam",
#     ]
#   }

#   push_restrictions = [
#     data.github_user.example.node_id,
#     "/exampleuser",
#     "exampleorganization/exampleteam",
#     # you can have more than one type of restriction (teams + users). If you use
#     # more than one type, you must use node_ids of each user and each team.
#     # github_team.example.node_id
#     # github_user.example-2.node_id
#   ]

#   force_push_bypassers = [
#     data.github_user.example.node_id,
#     "/exampleuser",
#     "exampleorganization/exampleteam",
#     # you can have more than one type of restriction (teams + users)
#     # github_team.example.node_id
#     # github_team.example-2.node_id
#   ]

# }

# resource "github_team_repository" "example" {
#   team_id    = github_team.example.id
#   repository = github_repository.example.name
#   permission = "pull"
# }