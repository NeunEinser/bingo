
advancement revoke @s only fetchr:barrel_item
execute \
	at @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=..10] \
	run function fetchr:tick/reset_barrels

clear @s minecraft:gray_stained_glass_pane[minecraft:item_model="fetchr:hidden"]
