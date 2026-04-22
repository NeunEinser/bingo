#> fetchr:init/update_lobby/update_structures
#
# Moves the updated clone back to the location of the normal lobby
#
# @within
#	function fetchr:init/update_lobby/update_structure

scoreboard players operation $init/lobby/update.clone_x fetchr.tmp -= $init/lobby/update.new_x_overlap fetchr.tmp

scoreboard players set $init/lobby/update.new_x fetchr.tmp 8
data \
	modify storage tmp.fetchr:init/update_lobby structures \
	set from storage tmp.fetchr:init/update_lobby new_structures

function fetchr:init/update_lobby/setup_clone_move