
advancement revoke @s only fetchr:category_chest_item
execute \
	at @e[type=minecraft:marker, tag=fetchr.spawn, distance=..10] \
	positioned ~-2.5 ~ ~1.5 \
	run function fetchr:tick/reset_category_chests

clear @s *[minecraft:custom_data~{category_chest_item: true}]
