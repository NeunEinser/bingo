
data \
	modify storage tmp.fetchr:game uuid \
	set from entity @n[type=minecraft:marker,tag=fetchr.dead_entity,distance=...1,limit=1] data.uuid
kill @n[type=minecraft:marker,tag=fetchr.dead_entity,distance=...1,limit=1]

function fetchr:game/spawn_loot_macro with storage tmp.fetchr:game

tag @s remove fetchr.killed_entity