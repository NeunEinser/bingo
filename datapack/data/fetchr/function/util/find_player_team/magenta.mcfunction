#> fetchr:util/find_player_team/magenta
#
# Marks team magenta as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:magenta"}]
data remove storage fetchr:card teams[{id: "fetchr:magenta"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.magenta] add fetchr.in_current_team