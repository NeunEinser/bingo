#> fetchr:util/find_connected_entities
#
# Tags all entities connected to @s with fetchr.connected
#
# @public
# @context
# 	entity The player

tag @a remove fetchr.current_player
tag @s add fetchr.current_player
execute at @s as @e[distance=..50] run function fetchr:util/find_connected_entities/tag_if_connected
execute at @s as @e[distance=..50] run tag @s remove fetchr.visited

tag @s remove fetchr.current_player