#> bingo:lobby/place_indestructible_blocks
#
# Place indistructible blocks.
#
# Players may be in survival mode like in old-school bingo. This function
# ensures nothing crucial can be broken.
#
# @internal
# @context dimension bingo:lobby

#>
# @private
#declare tag bingo.sign_lobby_end_sign

execute as @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] at @s if entity @a[distance=..10] run function bingo:lobby/place_indestructible_block
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_button] at @s if entity @a[distance=..10] run function bingo:lobby/place_indestructible_block

execute if entity @a[predicate=bingo:is_in_lobby] run schedule function bingo:lobby/place_indestructible_blocks 1s