#> bingo:card_frames/find_item
#
# This function finds the item in the given slot and returns it as found item in
# tmp.bingo:card_frames
#
# @internal
# @input
# 	score $card_frames/find_item.slot_id bingo.tmp The slot index of which the
# 		item should be returned.
# 	storage tmp.bingo:card_frames slots The slots of the current card
# @output storage tmp.bingo:card_frames foundItem

#>
# Input score for bingo:card_frames/find_item.
# May only be read by that function.
#
# This is the index of the slot of which the item should be returned
#
# @internal
#declare score_holder $card_frames/find_item.slot_id

#>
# Storage for bingo:card_frames/find_item.
# 
# Input: slots - Array with slots of the current card
# Output: foundItem - The item found in the given slot id
#
# @internal
#declare storage tmp.bingo:card_frames

execute if score $card_frames/find_item.slot_id bingo.tmp matches 0 run data modify storage tmp.bingo:card_frames foundItem set from storage tmp.bingo:card_frames slots[0].item.item
execute if score $card_frames/find_item.slot_id bingo.tmp matches 0 unless data storage tmp.bingo:card_frames slots[0].item.item run data modify storage tmp.bingo:card_frames foundItem set value {id: "minecraft:barrier", Count: 1b}

data remove storage tmp.bingo:card_frames slots[0]
scoreboard players remove $card_frames/find_item.slot_id bingo.tmp 1
execute if score $card_frames/find_item.slot_id bingo.tmp matches 0.. run function bingo:card_frames/find_item