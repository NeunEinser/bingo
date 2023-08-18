#> fetchr:lobby/place_lectern
#
# Places the lectern corresponding to the current marker
#
# @within function fetchr:lobby/place_indestructible_blocks
# @context
# 	entity The current lectern marker

execute if score $is_multiplayer fetchr.state matches 0 if entity @s[tag=fetchr.multiplayer_only] run return 0
execute if score $is_multiplayer fetchr.state matches 1 if entity @s[tag=fetchr.singleplayer_only] run return 0

execute if entity @s[tag=fetchr.lectern_north] run setblock ~ ~ ~ minecraft:lectern[facing=north, has_book=true]
execute if entity @s[tag=fetchr.lectern_east] run setblock ~ ~ ~ minecraft:lectern[facing=east, has_book=true]
execute if entity @s[tag=fetchr.lectern_south] run setblock ~ ~ ~ minecraft:lectern[facing=south, has_book=true]
execute if entity @s[tag=fetchr.lectern_west] run setblock ~ ~ ~ minecraft:lectern[facing=west, has_book=true]

data modify block ~ ~ ~ {} merge from entity @s data