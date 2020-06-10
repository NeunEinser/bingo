execute store result score $i bingo_tmp run data get storage bingo:tmp slot.id
data modify storage bingo:tmp previousSlots set from storage bingo:card teams[{selected: true}].slots
data remove storage bingo:tmp slots

function bingo:item_detection/helper/find_slot