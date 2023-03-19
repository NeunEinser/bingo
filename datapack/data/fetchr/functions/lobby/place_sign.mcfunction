#> fetchr:lobby/place_sign
#
# Places the sign corresponding to the current aec
#
# @within function fetchr:lobby/place_indestructible_blocks
# @context
# 	entity The current sign marker

#>
# @private

execute if entity @s[tag=fetchr.sign_north] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]
execute if entity @s[tag=fetchr.sign_east] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]
execute if entity @s[tag=fetchr.sign_south] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]
execute if entity @s[tag=fetchr.sign_west] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]

execute if entity @s[tag=fetchr.sign_strict_mode] run function fetchr:lobby/place_special_sign/strict_mode

data modify block ~ ~ ~ {} merge from entity @s data