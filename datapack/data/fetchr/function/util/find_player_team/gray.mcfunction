#> fetchr:util/find_player_team/gray
#
# Marks team gray as current team
#
# @within function fetchr:util/find_player_team

data modify storage io.fetchr:find_team current_team set from storage fetchr:card teams[{id: "fetchr:gray"}]
data remove storage fetchr:card teams[{id: "fetchr:gray"}]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.gray] add fetchr.in_current_team