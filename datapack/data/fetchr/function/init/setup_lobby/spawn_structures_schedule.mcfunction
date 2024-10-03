#> fetchr:init/setup_lobby/spawn_structures_schedule
#
# This function spawns all registered structures
#
# @within
# 	function fetchr:init/setup_lobby/*

#>
# @private
#declare score_holder $init/setup_lobby/spawn_structures.loaded
scoreboard players set $init/setup_lobby/spawn_structures.loaded fetchr.tmp 0

execute as @e[type=minecraft:marker, tag=fetchr.structure_spawner, limit=1] at @s if loaded ~-48 ~ ~23 if loaded ~-32 ~ ~23 if loaded ~-16 ~ ~23 if loaded ~ ~ ~23 if loaded ~16 ~ ~23 if loaded ~48 ~ ~23 run scoreboard players set $init/setup_lobby/spawn_structures.loaded fetchr.tmp 1

execute if score $init/setup_lobby/spawn_structures.loaded fetchr.tmp matches 1 as @e[type=minecraft:marker, tag=fetchr.structure_spawner, limit=1] at @s run function fetchr:init/setup_lobby/spawn_structures
execute unless score $init/setup_lobby/spawn_structures.loaded fetchr.tmp matches 1 run schedule function fetchr:init/setup_lobby/spawn_structures_schedule 1t