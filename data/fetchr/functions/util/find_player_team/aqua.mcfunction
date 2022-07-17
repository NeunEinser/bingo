#> fetchr:util/find_player_team/aqua
#
# Marks team aqua as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:aqua"}]
data remove storage fetchr:card teams[{id: "fetchr:aqua"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.aqua] add fetchr.in_current_team