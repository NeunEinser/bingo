#> bingo:card_generation/update_category_total_weight/iter
#
# A single iteration containing logic at the item currently in keptItems[-1]
# 
# Moves keptItems[-1] to items[] at the end and calls this function again as
# long as there are more items in keptItems[].
#
# @within
# 	function bingo:card_generation/update_category_total_weight/exec
# 	function bingo:card_generation/update_category_total_weight/iter

data modify entity @s Tags set from storage tmp.bingo:card_generation stringTesterTagCache
data modify entity @s Tags append from storage tmp.bingo:card_generation keptItems[-1].activeCategories[].id
#>
# @private
#declare score_holder $card_gen/remove_items.expected_tag_cnt
execute store result score $card_gen/remove_items.expected_tag_cnt bingo.tmp run data get storage tmp.bingo:card_generation items[-1].activeCategories
scoreboard players operation $card_gen/remove_items.expected_tag_cnt bingo.tmp += $card_gen.aec_tag_count bingo.tmp
#>
# @private
#declare score_holder $card_gen/remove_items.tag_count
execute store result score $card_gen/remove_items.tag_count bingo.tmp run data get entity @s Tags

execute unless score $card_gen/remove_items.expected_tag_cnt bingo.tmp = $card_gen/remove_items.tag_count bingo.tmp run function bingo:card_generation/update_category_total_weight/update_weight

data modify storage tmp.bingo:card_generation items append from storage tmp.bingo:card_generation keptItems[-1]
data remove storage tmp.bingo:card_generation keptItems[-1]

execute if data storage tmp.bingo:card_generation keptItems[0] run function bingo:card_generation/update_category_total_weight/iter