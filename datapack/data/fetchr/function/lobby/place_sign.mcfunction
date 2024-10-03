#> fetchr:lobby/place_sign
#
# Places the sign corresponding to the current marker
#
# @within function fetchr:lobby/place_indestructible_blocks
# @context
# 	entity The current sign marker

execute if score $is_multiplayer fetchr.state matches 0 if entity @s[tag=fetchr.multiplayer_only] run return 0
execute if score $is_multiplayer fetchr.state matches 1 if entity @s[tag=fetchr.singleplayer_only] run return 0

execute if entity @s[tag=fetchr.sign_north] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]
execute if entity @s[tag=fetchr.sign_east] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]
execute if entity @s[tag=fetchr.sign_south] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]
execute if entity @s[tag=fetchr.sign_west] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]
execute if entity @s[tag=fetchr.danger_sign_east] run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]

data modify block ~ ~ ~ {} merge from entity @s data