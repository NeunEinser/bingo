
execute \
	positioned ~ ~.9 ~ \
	run kill @e[type=minecraft:interaction, distance=...1]
execute \
	positioned ~ ~1.5 ~ \
	run kill @e[type=minecraft:item_display, distance=..2]

tag @s remove fetchr.closed_exit