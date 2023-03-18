#> fetchr:util/apply_active_item_tags/calculate_global_weight_and_add
#
# This calculates the global weight and adds the item.
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/calculate_global_weight_and_add
# @reads storage tmp.fetchr:apply_active_item_tags activeItems
# @writes storage fetchr:items activeCategories
# @writes storage fetchr:items activeItems

data modify storage fetchr:items activeItems append from storage tmp.fetchr:apply_active_item_tags activeItems[-1]

#>
# @private
#declare score_holder $apply_tags/mult_cat.denom
execute store result score $apply_tags/mult_cat.denom fetchr.tmp run data get storage fetchr:items activeItems[-1].weightDenom

#>
# @private
#declare score_holder $apply_tags/mult_cat.nom
execute store result score $apply_tags/mult_cat.nom fetchr.tmp run data get storage fetchr:items activeItems[-1].weightNom


scoreboard players operation $apply_tags/mult_cat.nom fetchr.tmp *= $available_category_weight fetchr.state
scoreboard players operation $apply_tags/mult_cat.nom fetchr.tmp /= $apply_tags/mult_cat.denom fetchr.tmp

scoreboard players operation $total_item_weight fetchr.state += $apply_tags/mult_cat.nom fetchr.tmp
execute store result storage fetchr:items activeItems[-1].weight int 1 run scoreboard players get $apply_tags/mult_cat.nom fetchr.tmp

data remove storage tmp.fetchr:apply_active_item_tags activeItems[-1]
execute if data storage tmp.fetchr:apply_active_item_tags activeItems[0] run function fetchr:util/apply_active_item_tags/calculate_global_weight_and_add