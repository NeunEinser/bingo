

$execute \
	if score $rand.out 91.math.io matches ..$(from) \
	if data storage fetchr:card slots[$(to)] \
	run data modify storage fetchr:card slots[$(to)] set from storage fetchr:card slots[$(from)]

$data modify storage fetchr:card slots[$(to)].slot_id set value $(to)b

$scoreboard players set $card_gen/move_slot.row fetchr.tmp $(to)
scoreboard players operation $card_gen/move_slot.row fetchr.tmp /= 3 fetchr.const

$execute \
	store result storage fetchr:card slots[$(to)].row byte 1 \
	run scoreboard players get $card_gen/move_slot.row fetchr.tmp