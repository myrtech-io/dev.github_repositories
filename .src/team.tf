resource "github_team" "teams" {
  for_each = { for team in local.team_info : team.name => team }

  name        = each.value.name
  description = each.value.description
  privacy     = "secret" # You can adjust the privacy settings as needed
}

resource "github_team_membership" "team_memberships" {
  for_each = { for team in local.team_info : team.name => team }
  team_id      = github_team.teams[each.value.name].id
  username = each.value.member_username
  role     = each.value.member_role
}

