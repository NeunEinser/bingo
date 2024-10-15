#> fetchr:item_detection/on_inventory_changed
#
# This function is called for every player while the game is running
#
# @within advancement fetchr:inventory_changed
# @context entity Player

execute \
	unless entity @s[tag=fetchr.has_slot0] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[0]
execute \
	unless entity @s[tag=fetchr.has_slot1] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[1]
execute \
	unless entity @s[tag=fetchr.has_slot2] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[2]
execute \
	unless entity @s[tag=fetchr.has_slot3] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[3]
execute \
	unless entity @s[tag=fetchr.has_slot4] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[4]
execute \
	unless entity @s[tag=fetchr.has_slot5] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/0 \
		with storage fetchr:card slots[5]
execute \
	unless entity @s[tag=fetchr.has_slot6] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[6]
execute \
	unless entity @s[tag=fetchr.has_slot7] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[7]
execute \
	unless entity @s[tag=fetchr.has_slot8] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[8]
execute \
	unless entity @s[tag=fetchr.has_slot9] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[9]
execute \
	unless entity @s[tag=fetchr.has_slot10] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[10]
execute \
	unless entity @s[tag=fetchr.has_slot11] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/1 \
		with storage fetchr:card slots[11]
execute \
	unless entity @s[tag=fetchr.has_slot12] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[12]
execute \
	unless entity @s[tag=fetchr.has_slot13] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[13]
execute \
	unless entity @s[tag=fetchr.has_slot14] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[14]
execute \
	unless entity @s[tag=fetchr.has_slot15] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[15]
execute \
	unless entity @s[tag=fetchr.has_slot16] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[16]
execute \
	unless entity @s[tag=fetchr.has_slot17] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/2 \
		with storage fetchr:card slots[17]
execute \
	unless entity @s[tag=fetchr.has_slot18] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[18]
execute \
	unless entity @s[tag=fetchr.has_slot19] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[19]
execute \
	unless entity @s[tag=fetchr.has_slot20] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[20]
execute \
	unless entity @s[tag=fetchr.has_slot21] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[21]
execute \
	unless entity @s[tag=fetchr.has_slot22] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[22]
execute \
	unless entity @s[tag=fetchr.has_slot23] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[23]
execute \
	unless entity @s[tag=fetchr.has_slot24] \
	in fetchr:lobby \
	run function fetchr:item_detection/check_and_announce/3 \
		with storage fetchr:card slots[24]

execute \
	if score $update_card fetchr.state matches 1 \
	in fetchr:lobby \
	run function fetchr:util/update_card

advancement revoke @s only fetchr:inventory_changed