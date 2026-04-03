
execute \
	as @e[type=minecraft:item,distance=..5] \
	if items entity @s contents minecraft:gray_stained_glass_pane[minecraft:item_model="fetchr:hidden"] \
	run kill @s

execute \
	as @e[type=minecraft:item,distance=..5] \
	if items entity @s contents minecraft:barrel \
	run kill @s

setblock ~3 ~-1 ~ minecraft:barrel[facing=east]
setblock ~ ~-1 ~3 minecraft:barrel[facing=south]
setblock ~-3 ~-1 ~ minecraft:barrel[facing=west]
setblock ~ ~-1 ~-3 minecraft:barrel[facing=north]

execute \
	positioned ~3 ~-1 ~ \
	run function fetchr:tick/reset_barrel
execute \
	positioned ~ ~-1 ~3 \
	run function fetchr:tick/reset_barrel
execute \
	positioned ~-3 ~-1 ~ \
	run function fetchr:tick/reset_barrel
execute \
	positioned ~ ~-1 ~-3 \
	run function fetchr:tick/reset_barrel