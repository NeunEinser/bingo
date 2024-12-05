#> fetchr:util/find_leashed_entities/tag_if_leashed
#
# Tags all entities leashed by @s with fetchr.leashed
#
# @within function fetchr:util/find_leashed_entities
# @context
# 	entity The entity to check

tag @s remove fetchr.owned
scoreboard players set $util.is_owned fetchr.tmp 0
execute \
	on owner \
	if entity @s[tag=fetchr.current_player] \
	run scoreboard players set $util.is_owned fetchr.tmp 1

execute \
	if score $util.is_owned fetchr.tmp matches 1 \
	run tag @s add fetchr.owned