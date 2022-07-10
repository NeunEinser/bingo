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

execute as @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] at @s if entity @a[distance=..10] run function bingo:lobby/place_sign
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] at @s unless block ~ ~ ~ #minecraft:signs run function bingo:lobby/place_sign

#region Buttons
execute unless block ~ ~ ~ minecraft:stone_button run setblock ~ ~ ~ minecraft:stone_button[face=wall,facing=north]
execute if entity @s[tag=bingo.button_red] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:red_concrete
execute if entity @s[tag=bingo.button_orange] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:orange_concrete
execute if entity @s[tag=bingo.button_yellow] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:yellow_concrete
execute if entity @s[tag=bingo.button_lime] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:lime_concrete
execute if entity @s[tag=bingo.button_green] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:green_concrete
execute if entity @s[tag=bingo.button_cyan] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:cyan_concrete
execute if entity @s[tag=bingo.button_light_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:light_blue_concrete
execute if entity @s[tag=bingo.button_blue] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:blue_concrete
execute if entity @s[tag=bingo.button_purple] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:purple_concrete
execute if entity @s[tag=bingo.button_magenta] run fill ~ ~-1 ~1 ~ ~1 ~1 minecraft:magenta_concrete
#endregion

execute if entity @a[predicate=bingo:is_in_lobby] run schedule function bingo:lobby/place_indestructible_blocks 1s