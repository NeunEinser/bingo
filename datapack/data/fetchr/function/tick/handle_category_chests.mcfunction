
execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.spawn, distance=..20] \
	run tag @s remove fetchr.category_chest_open

execute \
	if items entity @s player.cursor *[minecraft:custom_data~{category_chest_item: true}] \
	at @e[type=minecraft:marker, tag=fetchr.spawn, distance=..20] \
	positioned ~-2.5 ~ ~1.5 \
	run function fetchr:tick/reset_category_chests

execute \
	at @e[type=minecraft:marker, tag=fetchr.spawn, distance=..20] \
	positioned ~-2.5 ~-10 ~1.5 \
	if items entity @e[type=minecraft:item,dx=10,dy=320,dz=10] contents *[minecraft:custom_data~{category_chest_item: true}] \
	positioned ~ ~10 ~ \
	run function fetchr:tick/reset_category_chests