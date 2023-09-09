#> fetchr:game/skybox/tick
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/tick

execute at @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..13] if block ~ ~ ~ minecraft:stone_button[powered=true] run function fetchr:game/skybox/button_pressed

execute as @a[predicate=fetchr:is_in_game] at @s align y if block ~ ~ ~ minecraft:void_air run tp ~ ~1.1 ~
execute as @a[predicate=fetchr:is_in_game] at @s if block ~ ~-1 ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
execute as @a[predicate=fetchr:is_in_game] at @s unless block ~ ~-1 ~ minecraft:void_air run effect clear @s minecraft:levitation

particle minecraft:happy_villager ~ ~-63 ~ .125 16 .125 1 16 force
particle minecraft:happy_villager ~ ~-31 ~ .125 8 .125 1 8 force
particle minecraft:happy_villager ~ ~-15 ~ .125 4 .125 1 4 force
particle minecraft:happy_villager ~ ~-7 ~ .125 2 .125 1 2 force
particle minecraft:happy_villager ~ ~-3 ~ .125 1 .125 1 1 force

execute as @a[scores={fetchr.lobby=1}] run function fetchr:util/go_to_lobby