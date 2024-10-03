#> fetchr:util/find_player_team/cyan
#
# Marks team cyan as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:cyan"}]
data remove storage fetchr:card teams[{id: "fetchr:cyan"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.cyan] add fetchr.in_current_team