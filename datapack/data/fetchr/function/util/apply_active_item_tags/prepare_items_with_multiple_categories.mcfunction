#> fetchr:util/apply_active_item_tags/prepare_items_with_multiple_categories
#
# Caluclates needed multiplier changes for items with multiple categories and
# the actual weight nom and denom. 
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/prepare_items_with_multiple_categories
# @imput storage tmp.fetchr:apply_active_item_tags items

#>
# @private
#declare score_holder $apply_tags/mult_cat.denom

execute \
	store result score $apply_tags/mult_cat.denom fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].weight_denom

#>
# @private
#declare score_holder $apply_tags/mult_cat.nom
execute \
	store result score $apply_tags/mult_cat.nom fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].weight_nom

#>
# @private
#declare score_holder $apply_tags/mult_cat.cat_count
execute \
	store result score $apply_tags/mult_cat.cat_count fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].active_categories

scoreboard players operation $apply_tags/mult_cat.denom fetchr.tmp *= $apply_tags/mult_cat.cat_count fetchr.tmp
scoreboard players operation $gcd.a 91.math.io = $apply_tags/mult_cat.denom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $apply_tags/mult_cat.nom fetchr.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags/mult_cat.nom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $apply_tags/mult_cat.denom fetchr.tmp /= $gcd.result 91.math.io

execute \
	store result storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].weight_nom int 1 \
	run scoreboard players get $apply_tags/mult_cat.nom fetchr.tmp
execute \
	store result storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].weight_denom int 1 \
	run scoreboard players get $apply_tags/mult_cat.denom fetchr.tmp
data remove storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1].multiple_categories
data \
	modify storage fetchr:items active_items \
	append from storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1]

scoreboard players operation $gcd.a 91.math.io = $available_category_weight fetchr.state
scoreboard players operation $gcd.b 91.math.io = $apply_tags/mult_cat.denom fetchr.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags/mult_cat.denom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $available_category_weight fetchr.state *= $apply_tags/mult_cat.denom fetchr.tmp


data remove storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[-1]
execute \
	if data storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[0] \
	run function fetchr:util/apply_active_item_tags/prepare_items_with_multiple_categories