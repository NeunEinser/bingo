#> bingo:item_detection/set_overlay
#
# This function sets the border for the currently selected item for the
# currently selected team.
#
# It also outputs a success value, indicating whether the change was successful,
# or if the border was already set and the team already had the border set
#
# @within function bingo:item_detection/check_and_announce

#>
# @within
# 	function bingo:item_detection/find_slot
# 	function bingo:item_detection/set_overlay
#declare storage tmp.bingo:item_detection/set_overlay

#>
# Whether the border was successfully changed
#
# @within
# 	function bingo:item_detection/check_and_announce
# 	function bingo:item_detection/set_overlay 
#declare score_holder $item_detect/set_overlay.success

execute store result score $item_detect/find_slot.slot_id bingo.tmp run data get storage tmp.bingo:item_detection slot.id
data modify storage tmp.bingo:item_detection/set_overlay previousSlots set from storage bingo:card teams[-1].slots
data remove storage tmp.bingo:item_detection/set_overlay slots

function bingo:item_detection/find_slot

execute store success score $item_detect/set_overlay.success bingo.tmp run data modify storage tmp.bingo:item_detection/set_overlay slots[-1] set value '{"text": "\\uFFFE", "color": "black"}'
data modify storage tmp.bingo:item_detection/set_overlay slots append from storage tmp.bingo:item_detection/set_overlay previousSlots[]
data modify storage bingo:card teams[-1].slots set from storage tmp.bingo:item_detection/set_overlay slots