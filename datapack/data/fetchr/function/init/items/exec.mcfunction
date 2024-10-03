#> fetchr:init/items/exec
#
# Initializes everything related to items
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/items/exec

execute in fetchr:lobby positioned 0 0 0 as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] run function fetchr:init/items/lobby_loaded
execute in fetchr:lobby positioned 0 0 0 unless entity @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] run schedule function fetchr:init/items/exec 1t