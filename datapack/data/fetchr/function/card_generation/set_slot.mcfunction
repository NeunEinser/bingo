


$data \
	modify storage fetchr:card slots[$(slot_index)] \
	set from storage tmp.fetchr:card_generation items[-1]

$data modify storage fetchr:card slots[$(slot_index)].slot_id set value $(slot_index)b

$scoreboard players set $card_gen/move_slot.row fetchr.tmp $(slot_index)
scoreboard players operation $card_gen/move_slot.row fetchr.tmp /= 3 fetchr.const

$execute \
	store result storage fetchr:card slots[$(slot_index)].row byte 1 \
	run scoreboard players get $card_gen/move_slot.row fetchr.tmp