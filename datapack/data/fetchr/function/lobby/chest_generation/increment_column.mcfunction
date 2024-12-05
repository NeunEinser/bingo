#> fetchr:lobby/chest_generation/increment_column
#
# This increments the column, dealing with possible overflow.
#
# The row is also resetted to 0.
#
# @within fetchr:lobby/chest_generation/*

scoreboard players set $chest_generation.row fetchr.tmp 0
scoreboard players add $chest_generation.column fetchr.tmp 1

execute \
	store result storage tmp.fetchr:chest_generation next_chest.height byte 1 \
	run scoreboard players get $chest_generation.height fetchr.tmp
execute \
	unless block ~ ~ ~ minecraft:chest[type=single] \
	if score $chest_generation.column fetchr.tmp matches 9 \
	run function fetchr:lobby/chest_generation/next_chest \
		with storage tmp.fetchr:chest_generation next_chest
execute \
	if score $chest_generation.column fetchr.tmp matches 18 \
	run function fetchr:lobby/chest_generation/next_chest \
		with storage tmp.fetchr:chest_generation next_chest