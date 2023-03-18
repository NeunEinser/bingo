#> fetchr:util/find_player_team/black
#
# Marks team aqua as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:black"}]
data remove storage fetchr:card teams[{id: "fetchr:black"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.black] add fetchr.in_current_team