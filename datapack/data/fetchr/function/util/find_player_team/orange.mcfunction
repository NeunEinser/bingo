#> fetchr:util/find_player_team/orange
#
# Marks team orange as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:orange"}]
data remove storage fetchr:card teams[{id: "fetchr:orange"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.orange] add fetchr.in_current_team