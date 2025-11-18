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

scoreboard players set $init/lobby.entrance_offsetx fetchr.tmp 0
execute \
	store result score $init/lobby.entrance_offsetx fetchr.tmp \
	run data get storage fetchr:structure structures[0].entrance_position[0]

scoreboard players set $init/lobby.start_x fetchr.tmp 29999999
scoreboard players operation $init/lobby.start_x fetchr.tmp -= $init/lobby.entrance_offsetx fetchr.tmp

data modify storage tmp.fetchr:init/structures location set value { z: 7 }

execute \
	store result storage tmp.fetchr:init/structures location.x int 1 \
	run scoreboard players get $init/lobby.start_x fetchr.tmp

execute \
	if data storage fetchr:structure structures[0] \
	in fetchr:lobby \
	run function fetchr:init/setup_lobby/spawn_structure_schedule

execute \
	unless data storage fetchr:structure structures[0] \
	run function fetchr:init/setup_lobby/old_reference/run