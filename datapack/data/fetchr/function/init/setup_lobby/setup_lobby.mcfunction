#> fetchr:init/setup_lobby/schedule_lobby
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
# @within function fetchr:init/setup_lobby/end

data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:registries structures

data \
	modify storage tmp.fetchr:init/structures structures \
	append value { id: "fetchr:lobby_end", entrance_position: [I; 1, 0, 1], version: 1 }

scoreboard players set $init/lobby.is_reference fetchr.tmp 0
data modify storage fetchr:structure structures set value []
data modify storage tmp.fetchr:init/structures location set value {\
	x: 13,\
	z: 7\
}

function fetchr:init/setup_lobby/spawn_structure_schedule