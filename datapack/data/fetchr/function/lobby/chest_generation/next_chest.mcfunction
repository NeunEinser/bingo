#> fetchr:lobby/chest_generation/next_chest
#
# Moves to the next chest position and places the chest there
#
# @within function fetchr:lobby/chest_generation/increment_column
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

function #fetchr:lobby/before_item_pool_chest_incremented \
	with storage tmp.fetchr:chest_generation next_chest

$execute \
	if score $chest_generation.height fetchr.tmp matches 5.. \
	positioned ~-4 $(height) ~-3 \
	run function fetchr:lobby/chest_generation/place_ceiling
$execute if score $chest_generation.height fetchr.tmp matches 4.. \
	positioned ~ $(height) ~ \
	run function fetchr:lobby/chest_generation/place_scaffolding

scoreboard players add $chest_generation.height fetchr.tmp 1

clone ~ ~ ~ ~1 62 ~ ~ ~1 ~ filtered minecraft:chest move

#>
# @private
#declare score_holder $lobby/chest_gen.use_single_chest
scoreboard players set $lobby/chest_gen.use_single_chest fetchr.tmp 0
execute unless data storage tmp.fetchr:chest_generation categories[-1].items[5] unless data storage tmp.fetchr:chest_generation categories[-5].items[3] run scoreboard players set $lobby/chest_gen.use_single_chest fetchr.tmp 1

execute unless score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~ ~ ~ minecraft:chest[type=left]
execute unless score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~1 ~ ~ minecraft:chest[type=right]
execute if score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~ ~ ~ minecraft:chest[type=single]
execute if score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~1 ~ ~ minecraft:chest[type=single]

scoreboard players set $chest_generation.column fetchr.tmp 0
scoreboard players set $chest_generation.row fetchr.tmp 0

execute \
	store result storage tmp.fetchr:chest_generation next_chest.height byte 1 \
	run scoreboard players get $chest_generation.height fetchr.tmp

function #fetchr:lobby/item_pool_chest_incremented \
	with storage tmp.fetchr:chest_generation next_chest