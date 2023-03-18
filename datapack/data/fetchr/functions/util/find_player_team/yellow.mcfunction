#> fetchr:util/find_player_team/yellow
#
# Marks team yellow as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:yellow"}]
data remove storage fetchr:card teams[{id: "fetchr:yellow"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.yellow] add fetchr.in_current_team