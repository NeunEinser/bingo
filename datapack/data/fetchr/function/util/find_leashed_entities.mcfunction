#> fetchr:util/find_leashed_entities
#
# Tags all entities leashed by @s with fetchr.leashed
#
# @public
# @context
# 	entity The player

tag @a remove fetchr.current_player
tag @s add fetchr.current_player
execute at @s as @e[distance=..50] run function fetchr:util/find_entities/tag_if_leashed

tag @s remove fetchr.current_player