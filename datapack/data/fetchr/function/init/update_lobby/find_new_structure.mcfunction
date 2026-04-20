#> fetchr:init/update_lobby/find_new_structure
#
# Finds the corresponding new structure
#
# @within
# 	function fetchr:init/update_lobby/update_structure
# 	function fetchr:init/update_lobby/find_new_structure

data \
	modify storage tmp.fetchr:init/update_lobby data_comparision \
	set from storage tmp.fetchr:init/update_lobby structures[-1].id

execute \
	store success score $init/lobby/update.should_remove fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/update_lobby data_comparision \
		set from storage tmp.fetchr:init/update_lobby old_structures[0].id

execute \
	if score $init/lobby/update.should_remove fetchr.tmp matches 1 \
	run data remove storage tmp.fetchr:init/update_lobby structures[-1]

execute \
	if score $init/lobby/update.should_remove fetchr.tmp matches 1 \
	if data storage tmp.fetchr:init/update_lobby structures[0] \
	run function fetchr:init/update_lobby/find_new_structure