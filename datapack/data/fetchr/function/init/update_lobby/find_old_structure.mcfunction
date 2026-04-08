#> fetchr:init/update_lobby/find_structure
#
# Finds the corresponding compare structure's position
#
# @within
# 	function fetchr:init/update_lobby/update_structure
# 	function fetchr:init/update_lobby/flint_and_steel

execute \
	store result score $init/lobby/update.current_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].size[0]
scoreboard players operation $init/lobby/update.old_x fetchr.tmp -= $init/lobby/update.current_x fetchr.tmp
execute \
	store result score $init/lobby/update.current_x_offset fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby old_structures[0].entrance_position[0]
scoreboard players operation $init/lobby/update.old_x fetchr.tmp += $init/lobby/update.current_x_offset fetchr.tmp

data \
	modify storage tmp.fetchr:init/update_lobby current_id \
	set from storage tmp.fetchr:init/update_lobby structures[-1].id

scoreboard players set $init/lobby/update.continue_search fetchr.tmp 0
execute \
	store success score $init/lobby/update.continue_search fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/update_lobby current_id \
		set from storage tmp.fetchr:init/update_lobby old_structures[0].id

execute \
	if score $init/lobby/update.continue_search fetchr.tmp matches 1 \
	run data remove storage tmp.fetchr:init/update_lobby old_structures[0]

execute \
	if score $init/lobby/update.continue_search fetchr.tmp matches 1 \
	if data storage tmp.fetchr:init/update_lobby old_structures[0] \
	run function fetchr:init/update_lobby/find_old_structure