#> fetchr:util/find_connected_entities/tag_if_connected
#
# Tags all entities connected with @s with fetchr.connected
#
# @within function fetchr:util/find_connected_entities
# @context
# 	entity The entity to check

execute if entity @s[tag=fetchr.current_player] run return 1
execute if entity @s[tag=fetchr.visited,tag=fetchr.connected] run return 1
execute if entity @s[tag=fetchr.visited] run return 0

tag @s add fetchr.visited
tag @s remove fetchr.connected
scoreboard players set $util.is_connected fetchr.tmp 0

execute \
	if score $util.is_connected fetchr.tmp matches 0 \
	on leasher \
	if function fetchr:util/find_connected_entities/tag_if_connected \
	run scoreboard players set $util.is_connected fetchr.tmp 1

execute \
	if score $util.is_connected fetchr.tmp matches 0 \
	on owner \
	if function fetchr:util/find_connected_entities/tag_if_connected \
	run scoreboard players set $util.is_connected fetchr.tmp 1

execute \
	if score $util.is_connected fetchr.tmp matches 0 \
	on vehicle \
	if function fetchr:util/find_connected_entities/tag_if_connected \
	run scoreboard players set $util.is_connected fetchr.tmp 1

execute \
	if score $util.is_connected fetchr.tmp matches 0 \
	on passengers \
	if function fetchr:util/find_connected_entities/tag_if_connected \
	run scoreboard players set $util.is_connected fetchr.tmp 1

execute \
	if score $util.is_connected fetchr.tmp matches 1 \
	run function fetchr:util/find_connected_entities/tag_leashers
execute \
	if score $util.is_connected fetchr.tmp matches 1 \
	at @s \
	run tag @e[distance=..20] remove fetchr.visited_leasher

execute \
	if score $util.is_connected fetchr.tmp matches 1 \
	run return 1
