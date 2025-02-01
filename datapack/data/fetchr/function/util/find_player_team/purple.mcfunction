#> fetchr:util/find_player_team/purple
#
# Marks team purple as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:purple" }]
data remove storage fetchr:card teams[{ id: "fetchr:purple" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.purple] add fetchr.in_current_team