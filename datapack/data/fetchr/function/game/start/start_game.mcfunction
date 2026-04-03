
execute \
	if score $game_state fetchr.state matches 4 \
	run return 0
execute \
	in minecraft:overworld \
	unless data block 8 2 8 Items[{Slot: 0b}].components.minecraft:dimension_id \
	run return 0
execute \
	in minecraft:overworld \
	if data block 8 2 8 Items[{Slot: 0b}].components.minecraft:special_mine \
	run return 0
execute \
	in minecraft:overworld \
	run data \
		modify storage tmp.fetchr:game/start level_data.dimension_id \
		set from block 8 2 8 Items[{Slot: 0b}].components.minecraft:dimension_id

data \
		modify storage tmp.fetchr:game/start level_data.level_number \
		set string storage tmp.fetchr:game/start level_data.dimension_id 15

execute \
	in minecraft:overworld \
	run data \
		modify storage fetchr:items effects \
		set from block 8 2 8 Items[{Slot: 0b}].components.minecraft:world_modifiers.effects
data modify storage fetchr:card dimension.id set from storage tmp.fetchr:game/start level_data.dimension_id

execute \
	at @a[predicate=fetchr:is_in_game] \
	at @e[tag=fetchr.spawn, distance=..10, limit=1] \
	positioned ~1 ~ ~1 \
	run function fetchr:game/start/check_dimension_and_start with storage tmp.fetchr:game/start level_data