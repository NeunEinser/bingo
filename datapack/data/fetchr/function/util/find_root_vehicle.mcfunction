#> fetchr:util/find_root_vehicle
#
# Tags the root of a passenger stack seen from the current entity
#
# @public
# @context entity The enitity whose vehicles to check

tag @s remove fetchr.connected
scoreboard players set $util.is_passenger fetchr.tmp 0
execute \
	on vehicle \
	run scoreboard players set $util.is_passenger fetchr.tmp 1
execute \
	if score $util.is_passenger fetchr.tmp matches 0 \
	run return run tag @s add fetchr.root_vehicle

execute \
	on vehicle \
	run function fetchr:util/find_root_vehicle