#> fetchr:init/setup_lobby/schedule_reference
#
# This function places relevant structures in the lobby reference.
#
# @within function fetchr:init/init

scoreboard players set $init/lobby.is_reference fetchr.tmp 1
data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:structure structures

data modify storage tmp.fetchr:init/structures location set value {\
	x: 29999999,\
	z: 29999744\
}

function fetchr:init/setup_lobby/spawn_structure_schedule