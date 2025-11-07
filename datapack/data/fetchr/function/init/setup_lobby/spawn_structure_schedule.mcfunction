#> fetchr:init/setup_lobby/spawn_structure_schedule
#
# Delegates the position parameters to the forceload macro
#
# @within
# 	function fetchr:init/setup_lobby/*

execute \
	in fetchr:lobby \
	run function fetchr:init/setup_lobby/forceload with storage tmp.fetchr:init/structures location