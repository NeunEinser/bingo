#> fetchr:util/find_player_team/black
#
# Marks team aqua as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:black" }]
data remove storage fetchr:card teams[{ id: "fetchr:black" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.black] add fetchr.in_current_team