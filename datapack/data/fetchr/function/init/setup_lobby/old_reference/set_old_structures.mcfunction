#> fetchr:init/setup_lobby/setup_lobby/old_reference/set_old_structures
#
# This function sets old structures depending on the detected game version
#
# @within function fetchr:init/setup_lobby/old_reference/forceload

execute \
	unless entity @e[type=minecraft:marker,tag=fetchr.lobby_sign,limit=1] \
	run return run scoreboard players set $lobby_generated fetchr.state 1

data modify storage tmp.fetchr:init/structures structures set value []

data \
	modify storage tmp.fetchr:init/structures legacy_structures \
	set from storage fetchr:structure legacy_structures

data \
	modify storage tmp.fetchr:init/structures legacy_bingo_structures \
	set from storage fetchr:structure legacy_bingo_structures

execute \
	unless data storage tmp.fetchr:init/structures legacy_structures[0] \
	run data modify storage tmp.fetchr:init/structures legacy_structures set value [\
		"fetchr:credits",\
		"fetchr:card_generation",\
		"fetchr:tutorial"\
	]

execute \
	unless data storage tmp.fetchr:init/structures legacy_structures[{id: "fetchr:lobby_end"}] \
	run data \
		modify storage tmp.fetchr:init/structures legacy_structures \
		append value "fetchr:lobby_end"

function fetchr:init/setup_lobby/old_reference/init_structures
execute \
	if entity @e[type=minecraft:marker, tag=fetchr.join_game_sign, limit=1] \
	unless block 1 2 2 minecraft:barrier \
	run function fetchr:init/setup_lobby/old_reference/set_5.3-beta1
execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.join_game_sign, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.3-beta1

scoreboard players set $init/lobby.lobby_type fetchr.tmp 2

scoreboard players set $init/lobby.entrance_offsetx fetchr.tmp 0
execute \
	store result score $init/lobby.entrance_offsetx fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[0].entrance_position[0]

scoreboard players set $init/lobby.start_x fetchr.tmp 29999999
scoreboard players operation $init/lobby.start_x fetchr.tmp -= $init/lobby.entrance_offsetx fetchr.tmp
data modify storage tmp.fetchr:init/structures location set value { z: 7 }

execute \
	store result storage tmp.fetchr:init/structures location.x int 1 \
	run scoreboard players get $init/lobby.start_x fetchr.tmp

function fetchr:init/setup_lobby/spawn_structure_schedule