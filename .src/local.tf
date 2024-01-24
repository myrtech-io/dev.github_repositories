locals {
  repositories = yamldecode(file("../repositories.yaml")).repositories
  parsed_teams = yamldecode(file("teams.yaml"))["teams"]
  team_info = flatten([
    for team in local.parsed_teams : [
      for member, values in team.members : {
        name = team.name
        description = team.description
        member_username = values.username
        member_role = values.role
      }
    ]
  ])
}