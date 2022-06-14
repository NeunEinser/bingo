#> bingo:util/apply_active_item_tags/calculate_global_weight_and_add
#
# This calculates the global weight and adds the item.
#
# @within
# 	bingo:util/apply_active_item_tags
# 	bingo:util/apply_active_item_tags/calculate_global_weight_and_add
# @reads storage tmp.bingo:apply_active_item_tags activeItems
# @writes storage bingo:items activeCategories
# @writes storage bingo:items activeItems

data modify storage bingo:items activeItems append from storage tmp.bingo:apply_active_item_tags activeItems[-1]

#>
# @private
#declare score_holder $apply_tags/mult_cat.denom
execute store result score $apply_tags/mult_cat.denom bingo.tmp run data get storage bingo:items activeItems[-1].weightDenom

#>
# @private
#declare score_holder $apply_tags/mult_cat.nom
execute store result score $apply_tags/mult_cat.nom bingo.tmp run data get storage bingo:items activeItems[-1].weightNom


scoreboard players operation $apply_tags/mult_cat.nom bingo.tmp *= $available_category_weight bingo.state
scoreboard players operation $apply_tags/mult_cat.nom bingo.tmp /= $apply_tags/mult_cat.denom bingo.tmp

scoreboard players operation $total_item_weight bingo.state += $apply_tags/mult_cat.nom bingo.tmp
execute store result storage bingo:items activeItems[-1].weight int 1 run scoreboard players get $apply_tags/mult_cat.nom bingo.tmp

data remove storage tmp.bingo:apply_active_item_tags activeItems[-1]
execute if data storage tmp.bingo:apply_active_item_tags activeItems[0] run function bingo:util/apply_active_item_tags/calculate_global_weight_and_add