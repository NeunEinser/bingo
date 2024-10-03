#> fetchr:util/find_player_team/white
#
# Marks team white as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:white"}]
data remove storage fetchr:card teams[{id: "fetchr:white"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.white] add fetchr.in_current_team