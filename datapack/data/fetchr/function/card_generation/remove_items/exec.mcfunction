#> fetchr:card_generation/remove_items/exec
#
# Removes all items that are within a category of the current item
#
# @within
# 	function fetchr:card_generation/cleanup_and_next_slot
# 	function fetchr:card_generation/remove_items/exec

#>
# Indicates whether this item should be kept for future iterations or if it's no
# longer a valid pick.
#
# @within
# 	function fetchr:card_generation/remove_items
# 	function fetchr:card_generation/remove_items/**
#declare score_holder $card_gen/remove_items.keep_item

data modify entity @s Tags set from storage tmp.fetchr:card_generation stringTesterTagCache
data modify entity @s Tags append from storage tmp.fetchr:card_generation items[-1].active_categories[].id
#>
# @private
#declare score_holder $card_gen/remove_items.expected_tag_cnt
execute store result score $card_gen/remove_items.expected_tag_cnt fetchr.tmp run data get storage tmp.fetchr:card_generation items[-1].active_categories
scoreboard players operation $card_gen/remove_items.expected_tag_cnt fetchr.tmp += $card_gen.aec_tag_count fetchr.tmp
#>
# @private
#declare score_holder $card_gen/remove_items.tag_count
execute store result score $card_gen/remove_items.tag_count fetchr.tmp run data get entity @s Tags

execute if score $card_gen/remove_items.expected_tag_cnt fetchr.tmp = $card_gen/remove_items.tag_count fetchr.tmp run data modify storage tmp.fetchr:card_generation keptItems append from storage tmp.fetchr:card_generation items[-1]
execute unless score $card_gen/remove_items.expected_tag_cnt fetchr.tmp = $card_gen/remove_items.tag_count fetchr.tmp run function fetchr:card_generation/remove_items/handle_removed_item

data remove storage tmp.fetchr:card_generation items[-1]
execute if data storage tmp.fetchr:card_generation items[0] run function fetchr:card_generation/remove_items/exec