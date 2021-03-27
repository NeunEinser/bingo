#> bingo:lobby/chest_generation/sort_categories/determain_cardinality
#
# Determains how many merge sort iterations are needed for the current amount of
# categories
#
# @within
# 	function bingo:lobby/chest_generation/generate_item_chests
# 	function bingo:lobby/chest_generation/sort_categories/determain_cardinality
# @input score $chest_generation/sort/card.size bingo.tmp
# @output score $chest_generation/sort/card.out bingo.tmp

#>
# Input for bingo:lobby/chest_generation/sort_categories/determain_cardinality
# @within
# 	function bingo:lobby/chest_generation/sort_categories/determain_cardinality
# 	function bingo:lobby/chest_generation/generate_item_chests
#declare score_holder $chest_generation/sort/card.size
#>
# Output for bingo:lobby/chest_generation/sort_categories/determain_cardinality
# @within
# 	function bingo:lobby/chest_generation/sort_categories/determain_cardinality
# 	function bingo:lobby/chest_generation/generate_item_chests
#declare score_holder $chest_generation/sort/card.out
scoreboard players add $chest_generation/sort/card.out bingo.tmp 1

scoreboard players operation $chest_generation/sort/card.size bingo.tmp /= 2 bingo.const

execute if score $chest_generation/sort/card.size bingo.tmp matches 1.. run function bingo:lobby/chest_generation/sort_categories/determain_cardinality