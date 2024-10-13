#> fetchr:card_generation/remove_items/handle_removed_item
#
# Adjusts total_weight according to removed item
#
# @within function fetchr:card_generation/remove_items/exec

#>
# The current item's weight to adjust the remaining total weight
#
# @private
#declare score_holder $card_gen/remove_items.weight
execute store result score $card_gen/remove_items.weight fetchr.tmp run data get storage tmp.fetchr:card_generation items[-1].weight
scoreboard players operation $card_gen.total_weight fetchr.tmp -= $card_gen/remove_items.weight fetchr.tmp

execute if data storage tmp.fetchr:card_generation items[-1].active_categories[1] run function fetchr:card_generation/remove_items/add_categories_with_removed_item