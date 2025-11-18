#> fetchr:init/setup_lobby/schedule_lobby
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
# @within function fetchr:init/setup_lobby/end

scoreboard players set $lobby_generated fetchr.state 2

data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:registries structures

# The entrance x postion is only supposed to be used by the initial structure to
# possibly center the structure on the origin.
#
# It is also used by the lobby end to place a sign marker entity in the space of
# the previous structure, but this kind of overlap is not generally supported.
data \
	modify storage tmp.fetchr:init/structures structures[].entrance_position[0] \
	set value 0
data \
	modify storage tmp.fetchr:init/structures structures[0].entrance_position[0] \
	set from storage fetchr:registries structures[0].entrance_position[0]

data \
	modify storage tmp.fetchr:init/structures structures \
	append value { id: "fetchr:lobby_end", entrance_position: [I; 1, 0, 1], version: 1 }

scoreboard players set $init/lobby.lobby_type fetchr.tmp 0
data modify storage fetchr:structure structures set value []
data modify storage tmp.fetchr:init/structures location set value {\
	x: 7,\
	z: 7\
}

function fetchr:init/setup_lobby/spawn_structure_schedule