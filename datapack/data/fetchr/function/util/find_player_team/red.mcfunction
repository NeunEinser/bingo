#> fetchr:util/find_player_team/red
#
# Marks team red as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:red" }]
data remove storage fetchr:card teams[{ id: "fetchr:red" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.red] add fetchr.in_current_team