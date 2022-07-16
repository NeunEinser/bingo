#> bingo:lobby/place_indestructible_blocks
#
# Place indistructible blocks.
#
# Players may be in survival mode like in old-school bingo. This function
# ensures nothing crucial can be broken.
#
# @internal

#>
# @private
#declare tag bingo.sign_lobby_end_sign

execute as @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] at @s run function bingo:lobby/place_sign

#region Buttons
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_button] unless block ~ ~ ~ minecraft:stone_button run setblock ~ ~ ~ minecraft:stone_button[face=wall,facing=north]
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_red] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:red_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_orange] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:orange_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_yellow] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:yellow_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_lime] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:lime_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_green] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:green_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_cyan] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:cyan_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_light_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:light_blue_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:blue_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_purple] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:purple_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.button_magenta] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:magenta_concrete
#endregion

execute if entity @a[predicate=bingo:is_in_lobby] run schedule function bingo:lobby/place_indestructible_blocks 1s