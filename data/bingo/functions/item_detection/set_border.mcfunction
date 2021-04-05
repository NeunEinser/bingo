#> bingo:item_detection/set_border
#
# This function sets the border for the currently selected item for the
# currently selected team.
#
# It also outputs a success value, indicating whether the change was successful,
# or if the border was already set and the team already had the border set
#
# @within function bingo:item_detection/announce

#>
# @within
# 	function bingo:item_detection/find_slot
# 	function bingo:item_detection/set_border
#declare storage temp:bingo.item_detection/set_border

execute store result score $item_detect/find_slot.slot_id bingo.tmp run data get storage temp:bingo.input/item_detection slot.id
data modify storage temp:bingo.item_detection/set_border previousSlots set from storage bingo:card teams[-1].slots
data remove storage temp:bingo.item_detection/set_border slots

function bingo:item_detection/find_slot

data modify storage temp:bingo.item_detection/set_border slots[-1] set from storage bingo:card teams[-1].completedBorder

data modify storage temp:bingo.item_detection/set_border slots append from storage temp:bingo.item_detection/set_border previousSlots[]
data modify storage bingo:card teams[-1].slots set from storage temp:bingo.item_detection/set_border slots