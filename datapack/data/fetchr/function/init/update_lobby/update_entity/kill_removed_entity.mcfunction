#> fetchr:init/update_lobby/update_entity/kill_removed_entity
#
# Kills the entity in the old structure
#
# @within
# 	function fetchr:init/update_lobby/update_structure
# @context
# 	entity The entity to remove in old structure
# 	dimension fetchr:lobby

data modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_id set value "fetchr:none"
data \
	modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_id \
	set from entity @s data.fetchr.display_entity_id

execute \
	unless data entity @s data.fetchr.display_entity_id \
	as @n[type=minecraft:marker, distance=...1] \
	run data \
		modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_id \
		set from entity @s data.fetchr.display_entity_id

summon minecraft:text_display ~ ~ ~ {Tags: ["fetchr.vehicle"]}
ride @s mount @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]
data \
	modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_type \
	set from entity @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1] Passengers[0].id
kill @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]

function fetchr:init/update_lobby/update_entity/handle_reference \
	with storage tmp.fetchr:init/update_lobby update_coordinates

teleport @e[distance=0..,tag=fetchr.current_old, limit=1] 0 -127 0
kill @e[x=0.5,y=-127,z=0.5,distance=...1,tag=fetchr.current_old, limit=1]