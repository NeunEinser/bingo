
execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=..20] \
	run tag @s remove fetchr.exit_barrel_open

execute \
	if items entity @s player.cursor minecraft:gray_stained_glass_pane[minecraft:item_model="fetchr:hidden"] \
	at @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=..20] \
	run function fetchr:tick/reset_barrels