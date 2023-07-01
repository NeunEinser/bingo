#> fetchr:lobby/skybox_tick
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/tick

execute at @e[tag=fetchr.skybox_button] if block ~ ~ ~ minecraft:stone_button[powered=true] run function fetchr:lobby/on_skybox_button_pressed

execute as @a[predicate=fetchr:is_in_game] at @s align y if block ~ ~ ~ minecraft:void_air run tp ~ ~1.1 ~
execute as @a[predicate=fetchr:is_in_game] at @s if block ~ ~-1 ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
execute as @a[predicate=fetchr:is_in_game] at @s unless block ~ ~-1 ~ minecraft:void_air run effect clear @s minecraft:levitation

execute as @a[scores={fetchr.lobby=1}] run function fetchr:util/go_to_lobby