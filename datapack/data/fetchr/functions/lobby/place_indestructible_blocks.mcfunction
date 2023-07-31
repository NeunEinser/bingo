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

execute as @e[type=minecraft:marker, tag=fetchr.lobby_sign] at @s run function fetchr:lobby/place_sign
execute as @e[type=minecraft:marker, tag=fetchr.lobby_lectern] at @s unless block ~ ~ ~ minecraft:lectern[has_book=true] run function fetchr:lobby/place_lectern
execute if score $is_multiplayer fetchr.state matches 0 as @e[tag=fetchr.multiplayer_only] at @s run setblock ~ ~ ~ minecraft:air

execute if entity @a[predicate=fetchr:is_in_lobby] run schedule function fetchr:lobby/place_indestructible_blocks 1s