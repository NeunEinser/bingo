#> bingo:card_generation/cleanup_and_next_slot
#
# Performs cleanup after generating a slot. Not called for the last slot.
#
# @within function bingo:card_generation/generate_slot

data modify storage tmp.bingo:card_generation keptItems set value []
data modify storage tmp.bingo:card_generation stringTesterTagCache set value ["bingo.string_tester"]
data modify storage tmp.bingo:card_generation stringTesterTagCache append from storage tmp.bingo:card_generation items[-1].activeCategories[].id
data modify storage tmp.bingo:card_generation categoriesWithRemovedItem set value []
#>
# @within function bingo:card_generation/**
#declare score_holder $card_gen.aec_tag_count
execute store result score $card_gen.aec_tag_count bingo.tmp run data get storage tmp.bingo:card_generation stringTesterTagCache
function bingo:card_generation/remove_items/exec

#>
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/update_category_total_weight/*
# 	function bingo:card_generation/recalculate_item_weight/exec
#declare score_holder $card_gen.required_category_weight
execute unless data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run data modify storage tmp.bingo:card_generation items set from storage tmp.bingo:card_generation keptItems
execute if data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run function bingo:card_generation/update_category_total_weight/exec

scoreboard players add $card_gen.slot bingo.tmp 1
function bingo:card_generation/generate_slot