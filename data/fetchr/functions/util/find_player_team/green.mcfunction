#> fetchr:util/find_player_team/green
#
# Marks team green as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:green"}]
data remove storage fetchr:card teams[{id: "fetchr:green"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.green] add fetchr.in_current_team