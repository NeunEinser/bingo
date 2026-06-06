#> fetchr:init/items/exec
#
# This function initializes the item pool
#
# @within
# 	function fetchr:init/init

execute \
	in fetchr:lobby \
	unless loaded 0 0 0 \
	run schedule function fetchr:init/items/exec 1t

execute \
	in fetchr:lobby \
	if loaded 0 0 0 \
	as @e[type=minecraft:marker, x=.5,y=0,z=.5, tag=fetchr.string_tester, distance=...1, limit=1] \
	run function fetchr:init/items/lobby_loaded