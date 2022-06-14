#> bingo:card_generation/remove_items/exec
#
# Removes all items that are within a category of the current item
#
# @within
# 	function bingo:card_generation/cleanup_and_next_slot
# 	function bingo:card_generation/remove_items/exec

#>
# Indicates whether this item should be kept for future iterations or if it's no
# longer a valid pick.
#
# @within
# 	function bingo:card_generation/remove_items
# 	function bingo:card_generation/remove_items/**
#declare score_holder $card_gen/remove_items.keep_item

data modify entity @s Tags set from storage tmp.bingo:card_generation stringTesterTagCache
data modify entity @s Tags append from storage tmp.bingo:card_generation items[-1].activeCategories[].id
#>
# @private
#declare score_holder $card_gen/remove_items.expected_tag_cnt
execute store result score $card_gen/remove_items.expected_tag_cnt bingo.tmp run data get storage tmp.bingo:card_generation items[-1].activeCategories
scoreboard players operation $card_gen/remove_items.expected_tag_cnt bingo.tmp += $card_gen.aec_tag_count bingo.tmp
#>
# @private
#declare score_holder $card_gen/remove_items.tag_count
execute store result score $card_gen/remove_items.tag_count bingo.tmp run data get entity @s Tags

execute if score $card_gen/remove_items.expected_tag_cnt bingo.tmp = $card_gen/remove_items.tag_count bingo.tmp run data modify storage tmp.bingo:card_generation keptItems append from storage tmp.bingo:card_generation items[-1]
execute unless score $card_gen/remove_items.expected_tag_cnt bingo.tmp = $card_gen/remove_items.tag_count bingo.tmp run function bingo:card_generation/remove_items/handle_removed_item

data remove storage tmp.bingo:card_generation items[-1]
execute if data storage tmp.bingo:card_generation items[0] run function bingo:card_generation/remove_items/exec