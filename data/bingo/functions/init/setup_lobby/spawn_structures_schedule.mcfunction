#> bingo:init/setup_lobby/spawn_structures_schedule
#
# This function spawns all registered structures
#
# @within
# 	function bingo:init/setup_lobby/*

execute as @e[type=minecraft:marker, tag=bingo.structure_spawner, limit=1] at @s run function bingo:init/setup_lobby/spawn_structures