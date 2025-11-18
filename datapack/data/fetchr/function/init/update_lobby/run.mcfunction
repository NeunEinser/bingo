#> fetchr:init/update_lobby/run
#
# This will update the lobby if necessary.
#
# @within function fetchr:init/init

data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:registries structures

data \
	modify storage tmp.fetchr:init/structures old_structures \
	set from storage fetchr:structure structures

execute \
	store result score $init/lobby/update.structure_count fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures

execute \
	store result score $init/lobby/update.compare_structure_count fetchr.tmp \
	run data get storage tmp.fetchr:init/structures old_structures

scoreboard players set $init/lobby/update.should_update fetchr.tmp 0
execute \
	unless score $init/lobby/update.structure_count fetchr.tmp = $init/lobby/update.compare_structure_count fetchr.tmp \
	run scoreboard players set $init/lobby/update.should_update fetchr.tmp 1

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	run function fetchr:init/update_lobby/check

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	run return 0

scoreboard players set $lobby_generated fetchr.state 5
schedule clear fetchr:lobby/place_indestructible_blocks

data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:registries structures

scoreboard players set $init/lobby/update.clone_x fetchr.tmp -30000000
execute in fetchr:lobby run function fetchr:init/update_lobby/setup_structure
