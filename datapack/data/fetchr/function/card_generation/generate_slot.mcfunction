#> fetchr:card_generation/generate_slot
#
# Generates a slot per iteration for all 25 slots
#
# @within
# 	function fetchr:card_generation/generate_card
# 	function fetchr:card_generation/cleanup_and_next_slot

#region select item
execute \
	store result storage tmp.fetchr:rand_data max int 1 \
	run scoreboard players get $card_gen.total_weight fetchr.tmp
function neun_einser.math:random/next_int with storage tmp.fetchr:rand_data

data modify storage tmp.fetchr:card_generation skipped_items set value []
function fetchr:card_generation/find_item

data modify storage tmp.fetchr:card_generation items append from storage tmp.fetchr:card_generation skipped_items[]
#endregion

data modify storage fetchr:card slots append from storage tmp.fetchr:card_generation items[-1]

scoreboard players operation $card_gen.row fetchr.tmp = $card_gen.slot fetchr.tmp
execute \
	store result storage fetchr:card slots[-1].row byte 1 \
	run scoreboard players operation $card_gen.row fetchr.tmp /= 5 fetchr.const

function fetchr:card_generation/set_item_data with storage fetchr:card slots[-1]

execute \
	if score $card_gen.slot fetchr.tmp matches ..23 \
	run function fetchr:card_generation/cleanup_and_next_slot