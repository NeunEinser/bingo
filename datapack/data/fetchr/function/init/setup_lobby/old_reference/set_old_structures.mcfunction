#> fetchr:init/setup_lobby/setup_lobby/old_reference/set_old_structures
#
# This function sets old structures depending on the detected game version
#
# @within function fetchr:init/setup_lobby/old_reference/forceload

data modify storage tmp.fetchr:init/structures structures set value []

data \
	modify storage tmp.fetchr:init/structures legacy_structures \
	set from storage fetchr:structure legacy_structures

data \
	modify storage tmp.fetchr:init/structures legacy_bingo_structures \
	set from storage fetchr:structure legacy_bingo_structures

execute \
	unless data storage tmp.fetchr:init/structures legacy_structures[0] \
	if data storage tmp.fetchr:init/structures legacy_bingo_structures[0] \
	run function fetchr:init/setup_lobby/old_reference/set_from_bingo_namespace

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
	unless entity @e[type=minecraft:marker, tag=fetchr.join_game_sign, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.2-pre4

scoreboard players set $init/lobby.lobby_type fetchr.tmp 2
function fetchr:init/setup_lobby/spawn_structure_schedule