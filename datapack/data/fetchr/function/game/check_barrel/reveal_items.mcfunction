
data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[0]
data modify storage tmp:game/goal_detection data merge value { barrel_slot: 3, card_slot: 0 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[1]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 4, card_slot: 1 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[2]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 5, card_slot: 2 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[3]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 12, card_slot: 3 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[4]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 13, card_slot: 4 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[5]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 14, card_slot: 5 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[6]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 21, card_slot: 6 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[7]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 22, card_slot: 7 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set from storage fetchr:card slots[8]
data modify storage tmp.fetchr:game/goal_detection data merge value { barrel_slot: 23, card_slot: 8 }
execute \
	unless data storage fetchr:card data{revealed: true} \
	run function fetchr:game/check_barrel/reveal_items/check_and_reveal with storage tmp.fetchr:game/goal_detection data