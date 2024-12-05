#> fetchr:util/find_leashed_entities/tag_if_leashed
#
# Tags all entities leashed by @s with fetchr.leashed
#
# @within function fetchr:util/find_leashed_entities
# @context
# 	entity The entity to check

tag @s remove fetchr.leashed
scoreboard players set $util.is_leashed fetchr.tmp 0
execute \
	on leasher \
	if entity @s[tag=fetchr.current_player] \
	run scoreboard players set $util.is_leashed fetchr.tmp 1

execute \
	if score $util.is_leashed fetchr.tmp matches 1 \
	run tag @s add fetchr.leashed