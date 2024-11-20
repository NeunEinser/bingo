#> fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory
#
# Gives the player items back from an inner inventory of the accepted item
#
# @within
# 	function fetchr:item_detection/handle_item_from_inventory/exec
# 	function fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory

data \
	modify storage io.fetchr:util item \
	set from storage tmp.fetchr:item_detect inventory[0]

function fetchr:util/item_nbt_to_command_argument/exec

data \
	modify storage tmp.fetchr:item_detect inventory[0].command_argument \
	set from storage io.fetchr:util command_argument
execute \
	unless data storage tmp.fetchr:item_detect inventory[0].count \
	run data modify storage tmp.fetchr:item_detect inventory[0].count set value 1
function fetchr:item_detection/handle_item_from_inventory/give_item \
	with storage tmp.fetchr:item_detect inventory[0]

data remove storage tmp.fetchr:item_detect inventory[0]
execute \
	if data storage tmp.fetchr:item_detect inventory[0] \
	run function fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory