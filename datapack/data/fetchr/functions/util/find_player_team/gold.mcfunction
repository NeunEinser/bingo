#> fetchr:util/find_player_team/gold
#
# Marks team gold as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:gold"}]
data remove storage fetchr:card teams[{id: "fetchr:gold"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.gold] add fetchr.in_current_team