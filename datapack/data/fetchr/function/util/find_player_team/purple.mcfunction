#> fetchr:util/find_player_team/purple
#
# Marks team purple as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:purple"}]
data remove storage fetchr:card teams[{id: "fetchr:purple"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.purple] add fetchr.in_current_team