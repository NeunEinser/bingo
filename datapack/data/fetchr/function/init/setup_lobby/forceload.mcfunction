#> fetchr:init/setup_lobby/spawn_structure_schedule
#
# Loads chunks and spawns the next structure
#
# @within
# 	function fetchr:init/setup_lobby/spawn_structure_schedule

$forceload add $(x) $(z)

$execute \
	if loaded $(x) 3 $(z) \
	positioned $(x) 3 $(z) \
	run function fetchr:init/setup_lobby/spawn_structure

$execute \
	unless loaded $(x) 3 $(z) \
	run schedule function fetchr:init/setup_lobby/spawn_structure_schedule 1t