#> fetchr:util/find_player_team/yellow
#
# Marks team yellow as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:yellow" }]
data remove storage fetchr:card teams[{ id: "fetchr:yellow" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.yellow] add fetchr.in_current_team