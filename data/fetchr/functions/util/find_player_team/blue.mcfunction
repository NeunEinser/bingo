#> fetchr:util/find_player_team/blue
#
# Marks team blue as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:blue"}]
data remove storage fetchr:card teams[{id: "fetchr:blue"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.blue] add fetchr.in_current_team