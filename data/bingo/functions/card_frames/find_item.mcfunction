#> bingo:card_frames/find_item
#
# This function finds the item in the given slot and returns it as found item in
# temp:bingo.output/card_item
#
# @internal
# @input
# 	score $card_frames/find_item.slot_id bingo.tmp The slot index of which the
# 		item should be returned.
# 	storage temp:bingo.input/card_item slots The slots of the current card
# @output storage temp:bingo.output/card_item found_item

#>
# Input score for bingo:card_frames/find_item.
# May only be read by that function.
#
# This is the index of the slot of which the item should be returned
#
# @internal
#declare score_holder $card_frames/find_item.slot_id

#>
# Input storage for bingo:card_frames/find_item.
# May only be read by that function.
#
# This should hold the slots of the current card in the slots field
#
# @internal
#declare storage temp:bingo.input/card_item

#>
# Output storage for bingo:card_frames/find_item
# May only be written to by that function
#
# This holds the item that was found in the given slot in found_item
#
# @internal
#declare storage temp:bingo.output/card_item

execute if score $card_frames/find_item.slot_id bingo.tmp matches 0 run data modify storage temp:bingo.output/card_item found_item set from storage temp:bingo.input/card_item slots[0].item.item
execute if score $card_frames/find_item.slot_id bingo.tmp matches 0 unless data storage temp:bingo.input/card_item slots[0].item.item run data modify storage temp:bingo.output/card_item found_item set value {id: "minecraft:barrier", Count: 1b}

data remove storage temp:bingo.input/card_item slots[0]
scoreboard players remove $card_frames/find_item.slot_id bingo.tmp 1
execute if score $card_frames/find_item.slot_id bingo.tmp matches 0.. run function bingo:card_frames/find_item