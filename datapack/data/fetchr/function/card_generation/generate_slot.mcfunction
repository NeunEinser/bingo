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

execute \
	store result storage tmp.fetchr:rand_data max int 1 \
	run scoreboard players get $card_gen.slot fetchr.tmp
function neun_einser.math:random/next_int with storage tmp.fetchr:rand_data

data modify storage fetchr:card slots append value {}
function fetchr:card_generation/move_slot { from: 7, to: 8 }
function fetchr:card_generation/move_slot { from: 6, to: 7 }
function fetchr:card_generation/move_slot { from: 5, to: 6 }
function fetchr:card_generation/move_slot { from: 4, to: 5 }
function fetchr:card_generation/move_slot { from: 3, to: 4 }
function fetchr:card_generation/move_slot { from: 2, to: 3 }
function fetchr:card_generation/move_slot { from: 1, to: 2 }
function fetchr:card_generation/move_slot { from: 0, to: 1 }

execute \
	store result storage tmp.fetchr:card_generation slot.slot_index int 1 \
	run scoreboard players get $rand.out 91.math.io

function fetchr:card_generation/set_slot with storage tmp.fetchr:card_generation slot

execute \
	if score $card_gen.slot fetchr.tmp matches ..7 \
	run function fetchr:card_generation/cleanup_and_next_slot