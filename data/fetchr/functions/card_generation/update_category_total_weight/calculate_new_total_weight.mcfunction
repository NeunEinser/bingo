#> fetchr:card_generation/update_category_total_weight/calculate_new_total_weight
#
# Recalculates the current category's total weight
#
# @within
# 	function fetchr:card_generation/update_category_total_weight/calculate_item_weight
# 	function fetchr:card_generation/update_category_total_weight/calculate_new_total_weight

#>
# @private
#declare score_holder $card_gen/cat_weight.different_category
#>
# @private
#declare score_holder $card_gen/cat_weight.current_weight
execute store result score $card_gen/cat_weight.current_weight fetchr.tmp run data get storage tmp.fetchr:card_generation checkCategories[-1].weight

data modify storage tmp.fetchr:card_generation category set from storage tmp.fetchr:card_generation itemCategories[-1].id
execute store success score $card_gen/cat_weight.different_category fetchr.tmp run data modify storage tmp.fetchr:card_generation category set from storage tmp.fetchr:card_generation checkCategories[-1].id

execute if score $card_gen/cat_weight.different_category fetchr.tmp matches 0 run scoreboard players operation $card_gen/cat_weight.total_weight fetchr.tmp -= $card_gen/cat_weight.current_weight fetchr.tmp

data remove storage tmp.fetchr:card_generation checkCategories[-1]
execute if data storage tmp.fetchr:card_generation checkCategories[0] run function fetchr:card_generation/update_category_total_weight/calculate_new_total_weight