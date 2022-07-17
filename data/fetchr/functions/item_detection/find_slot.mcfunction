#> fetchr:item_detection/find_slot
#
# This function is used to iterate through the current slots until the correct
# one is found
#
# @within
# 	function fetchr:item_detection/find_slot
# 	function fetchr:item_detection/set_overlay
# @input score $item_detect/find_slot.slot_id fetchr.tmp The slot id of the slot that is searched

#>
# The slot id of the slot that is searched
#
# This is an input for function fetchr:item_detection/find_slot
#
# @within
# 	function fetchr:item_detection/find_slot
# 	function fetchr:item_detection/set_overlay
#declare score_holder $item_detect/find_slot.slot_id

data modify storage tmp.fetchr:item_detection/set_overlay slots append from storage tmp.fetchr:item_detection/set_overlay previousSlots[0]
data remove storage tmp.fetchr:item_detection/set_overlay previousSlots[0]

scoreboard players remove $item_detect/find_slot.slot_id fetchr.tmp 1
execute if score $item_detect/find_slot.slot_id fetchr.tmp matches 0.. run function fetchr:item_detection/find_slot