
tellraw @a[tag=fetchr.category_chest_open] {translate:"fetchr.category_chest.stolen"}
tellraw @a[scores={fetchr.break_chest=1}] {translate:"fetchr.category_chest.stolen"}

clear @s *[minecraft:custom_data~{category_chest_item: true}]
fill ~ ~ ~ ~1 319 ~ minecraft:air replace minecraft:chest destroy

execute \
	positioned ~ ~-10 ~ \
	as @e[type=minecraft:item,dx=7,dy=320,dz=5] \
	if items entity @s contents *[minecraft:custom_data~{category_chest_item: true}] \
	run kill @s
execute \
	as @e[type=minecraft:item,dx=2,dy=320,dz=1] \
	if items entity @s contents minecraft:chest \
	run kill @s

function fetchr:chest_generation/generate_item_chests