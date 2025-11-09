#> fetchr:init/setup_lobby/schedule_reference
#
# This function places relevant structures in the lobby reference.
#
# @within function fetchr:init/init

data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:structure structures

scoreboard players set $lobby_generated fetchr.state 3
scoreboard players set $init/lobby.lobby_type fetchr.tmp 1

data modify storage tmp.fetchr:init/structures location set value {\
	x: 29999999,\
	z: 29999744\
}

execute \
	if data storage fetchr:structure structures[0] \
	in fetchr:lobby \
	run function fetchr:init/setup_lobby/spawn_structure_schedule

execute \
	unless data storage fetchr:structure structures[0] \
	run function fetchr:init/setup_lobby/old_reference/run