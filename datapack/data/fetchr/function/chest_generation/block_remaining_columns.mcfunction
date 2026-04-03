function fetchr:chest_generation/increment_column
function fetchr:chest_generation/items_iter
scoreboard players remove $chest_generation.remaining_cols fetchr.tmp 1
execute \
	if score $chest_generation.remaining_cols fetchr.tmp matches 1.. \
	run function fetchr:chest_generation/block_remaining_columns
