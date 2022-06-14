#> bingo:card_generation/remove_items/handle_removed_item
#
# Adjusts total_weight according to removed item
#
# @within function bingo:card_generation/remove_items/exec

#>
# The current item's weight to adjust the remaining total weight
#
# @private
#declare score_holder $card_gen/remove_items.weight
execute store result score $card_gen/remove_items.weight bingo.tmp run data get storage tmp.bingo:card_generation items[-1].weight
scoreboard players operation $card_gen.total_weight bingo.tmp -= $card_gen/remove_items.weight bingo.tmp

execute if data storage tmp.bingo:card_generation items[-1].activeCategories[1] run function bingo:card_generation/remove_items/add_categories_with_removed_item