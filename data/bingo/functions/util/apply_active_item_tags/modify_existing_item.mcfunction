#> bingo:util/apply_active_item_tags/modify_existing_item
#
# Adds all items of the current category to activeItems
#
# @within bingo:util/apply_active_item_tags/add_items_from_category
# @writes storage tmp.bingo:apply_active_item_tags activeItems

#>
# @private
#declare score_holder $apply_tags/mod_existing.result_denom
execute store result score $apply_tags/mod_existing.result_denom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags activeItems[-1].weightDenom

#>
# @private
#declare score_holder $apply_tags/mod_existing.cur_denom
execute store result score $apply_tags/mod_existing.cur_denom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags categories[-1].totalItemWeight

#>
# @private
#declare score_holder $apply_tags/mod_existing.result_nom
execute store result score $apply_tags/mod_existing.result_nom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags activeItems[-1].weightNom

#>
# @private
#declare score_holder $apply_tags/mod_existing.cur_nom
execute store result score $apply_tags/mod_existing.cur_nom bingo.tmp run data get storage tmp.bingo:apply_active_item_tags categories[-1].items[-1].weight

scoreboard players operation $apply_tags/mod_existing.cur_nom bingo.tmp *= $apply_tags/mod_existing.result_denom bingo.tmp
scoreboard players operation $apply_tags/mod_existing.result_denom bingo.tmp *= $apply_tags/mod_existing.cur_denom bingo.tmp
scoreboard players operation $apply_tags/mod_existing.result_nom bingo.tmp *= $apply_tags/mod_existing.cur_denom bingo.tmp
scoreboard players operation $apply_tags/mod_existing.result_nom bingo.tmp += $apply_tags/mod_existing.cur_nom bingo.tmp

execute store result storage tmp.bingo:apply_active_item_tags activeItems[-1].weightDenom int 1 run scoreboard players get $apply_tags/mod_existing.result_denom bingo.tmp
execute store result storage tmp.bingo:apply_active_item_tags activeItems[-1].weightNom int 1 run scoreboard players get $apply_tags/mod_existing.result_nom bingo.tmp
data modify storage tmp.bingo:apply_active_item_tags activeItems[-1].multipleCategories set value true

