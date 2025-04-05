#> fetchr:init/items/exec
#
# Initializes everything related to items
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/items/exec

execute \
	in fetchr:resourcepack_check \
	positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:init/items/lobby_loaded