#> fetchr:chest_generation/sort_items/determain_cardinality
#
# Determains how many merge sort iterations are needed for the current amount of
# categories
#
# @within
# 	function fetchr:chest_generation/category_iter
# 	function fetchr:chest_generation/sort_items/determain_cardinality
# @input score $chest_generation/sort/card.size fetchr.tmp
# @output score $chest_generation/sort/card.out fetchr.tmp

#>
# Input for fetchr:chest_generation/sort_items/determain_cardinality
# @within
# 	function fetchr:chest_generation/sort_items/determain_cardinality
# 	function fetchr:chest_generation/category_iter
#declare score_holder $chest_generation/sort/card.size
#>
# Output for fetchr:chest_generation/sort_items/determain_cardinality
# @within
# 	function fetchr:chest_generation/sort_items/determain_cardinality
# 	function fetchr:chest_generation/category_iter
#declare score_holder $chest_generation/sort/card.out
scoreboard players add $chest_generation/sort/card.out fetchr.tmp 1

scoreboard players operation $chest_generation/sort/card.size fetchr.tmp /= 2 fetchr.const

execute if score $chest_generation/sort/card.size fetchr.tmp matches 1.. run function fetchr:chest_generation/sort_items/determain_cardinality