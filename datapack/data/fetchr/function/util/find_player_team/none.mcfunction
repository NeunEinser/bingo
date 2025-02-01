#> fetchr:util/find_player_team/none
#
# Marks team players with no team as current team
#
# @within function fetchr:util/find_player_team

data \
	modify storage io.fetchr:find_team current_team \
	set from storage fetchr:card teams[{ id: "fetchr:none" }]
data remove storage fetchr:card teams[{ id: "fetchr:none" }]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[ team=] add fetchr.in_current_team