#> bingo:util/apply_active_item_tags/prepare_items_with_multiple_categories
#
# Caluclates needed multiplier changes for items with multiple categories and
# the actual weight nom and denom. 
#
# @within
# 	bingo:util/apply_active_item_tags
# 	bingo:util/apply_active_item_tags/prepare_items_with_multiple_categories
# @imput storage tmp.bingo:apply_active_item_tags items

#>
# @private
#declare score_holder $apply_tags/mult_cat.denom
execute store result score $apply_tags/mult_cat.denom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags items[-1].weightDenom

#>
# @private
#declare score_holder $apply_tags/mult_cat.nom
execute store result score $apply_tags/mult_cat.nom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags items[-1].weightNom

#>
# @private
#declare score_holder $apply_tags/mult_cat.cat_count
execute store result score $apply_tags/mult_cat.cat_count bingo.tmp run data get storage tmp.bingo:apply_active_item_tags items[-1].categories

scoreboard players operation $apply_tags/mult_cat.denom bingo.tmp *= $apply_tags/mult_cat.cat_count bingo.tmp

scoreboard players operation $gcd.a 91.math.io = $apply_tags/mult_cat.denom bingo.tmp
scoreboard players operation $gcd.b 91.math.io = $apply_tags/mult_cat.nom bingo.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags/mult_cat.nom bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $apply_tags/mult_cat.denom bingo.tmp /= $gcd.result 91.math.io


execute store result storage tmp.bingo:apply_active_item_tags items[-1].weightNom int 1 run scoreboard players get $apply_tags/mult_cat.nom bingo.tmp
execute store result storage tmp.bingo:apply_active_item_tags items[-1].weightDenom int 1 run scoreboard players get $apply_tags/mult_cat.denom bingo.tmp
data remove storage tmp.bingo:apply_active_item_tags items[-1].multipleCategories
data modify storage tmp.bingo:apply_active_item_tags activeItems append from storage tmp.bingo:apply_active_item_tags items[-1]

scoreboard players operation $gcd.a 91.math.io = $available_category_weight bingo.state
scoreboard players operation $gcd.b 91.math.io = $apply_tags/mult_cat.denom bingo.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags/mult_cat.denom bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $available_category_weight bingo.state *= $apply_tags/mult_cat.denom bingo.tmp


data remove storage tmp.bingo:apply_active_item_tags items[-1]
execute if data storage tmp.bingo:apply_active_item_tags items[0] run function bingo:util/apply_active_item_tags/prepare_items_with_multiple_categories