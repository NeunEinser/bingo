#> fetchr:util/find_player_team/lime
#
# Marks team lime as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:lime"}]
data remove storage fetchr:card teams[{id: "fetchr:lime"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.lime] add fetchr.in_current_team