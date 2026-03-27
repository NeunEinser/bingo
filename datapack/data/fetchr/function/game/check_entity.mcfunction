
execute \
	if data entity @s {Health: 0f} \
	run summon minecraft:marker ~ ~ ~ {Tags:["fetchr.dead_entity"]}

data \
	modify entity @n[type=minecraft:marker,tag=fetchr.dead_entity,distance=...1,limit=1] data.uuid \
	set from storage tmp.fetchr:game uuid

execute \
	unless data entity @s {Health: 0f} \
	run data modify storage tmp.fetchr:game still_active_uuids append from storage tmp.fetchr:game uuid