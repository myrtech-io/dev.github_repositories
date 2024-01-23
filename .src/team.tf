# resource "github_team" "myrtech-teams" {
#   for_each = local.teams
#   name = each.value.teams.name
#   description = each.value.teams.description
#   privacy     = "secret"
# }

# resource "github_team_membership" "myrtech_teams_membership" {
#   for_each = { for team, member in local.teams }

#   team_id  = github_team.myrtech-teams[each.value].id
#   username = each.value.username
#   role     = each.value.role
# }

output teams {
  value = local.team
}