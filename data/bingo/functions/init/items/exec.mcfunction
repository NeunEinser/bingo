#> bingo:init/items/exec
#
# Initializes everything related to items
#
# @within
# 	function bingo:init/init
# 	function bingo:init/items/exec

execute in bingo:lobby positioned 0 0 0 as @e[type=minecraft:area_effect_cloud, tag=bingo.string_tester, distance=..0.1, limit=1] run function bingo:init/items/lobby_loaded
execute in bingo:lobby positioned 0 0 0 unless entity @e[type=minecraft:area_effect_cloud, tag=bingo.string_tester, distance=..0.1, limit=1] run schedule function bingo:init/items/exec 1t