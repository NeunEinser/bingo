#> fetchr:lobby/place_indestructible_blocks
#
# Place indistructible blocks.
#
# Players may be in survival mode like in old-school bingo. This function
# ensures nothing crucial can be broken.
#
# @internal

#>
# @private
#declare tag fetchr.sign_lobby_end_sign

execute as @e[type=minecraft:area_effect_cloud, tag=fetchr.lobby_sign] at @s run function fetchr:lobby/place_sign

#region Buttons
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.lobby_button] unless block ~ ~ ~ minecraft:stone_button run setblock ~ ~ ~ minecraft:stone_button[face=wall,facing=north]
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_red] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:red_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_orange] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:orange_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_yellow] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:yellow_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_lime] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:lime_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_green] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:green_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_cyan] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:cyan_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_light_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:light_blue_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:blue_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_purple] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:purple_concrete
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.button_magenta] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:magenta_concrete
#endregion

execute if entity @a[predicate=fetchr:is_in_lobby] run schedule function fetchr:lobby/place_indestructible_blocks 1s