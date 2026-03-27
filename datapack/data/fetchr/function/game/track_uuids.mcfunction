
execute \
	as @e[tag=!fetchr.tracked,type=!minecraft:player,type=!minecraft:marker,type=!minecraft:item_display,type=!minecraft:item_frame,type=!minecraft:item,\
		type=!minecraft:minecart,type=!minecraft:chest_minecart,type=!minecraft:tnt_minecart,type=!minecraft:hopper_minecart,type=!minecraft:furnace_minecart,\
		type=!#minecraft:boat, x=0] \
	run function fetchr:game/track_uuid