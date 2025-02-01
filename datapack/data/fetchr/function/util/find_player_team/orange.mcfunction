#> fetchr:util/find_player_team/orange
#
# Marks team orange as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:orange" }]
data remove storage fetchr:card teams[{ id: "fetchr:orange" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.orange] add fetchr.in_current_team