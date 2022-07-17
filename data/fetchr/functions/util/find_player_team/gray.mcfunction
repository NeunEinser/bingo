#> fetchr:util/find_player_team/gray
#
# Marks team gray as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:gray"}]
data remove storage fetchr:card teams[{id: "fetchr:gray"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.gray] add fetchr.in_current_team