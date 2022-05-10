#> bingo:card_generation/remove_items
#
# Removes all items that are within a category of the current item
#
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/remove_items

#>
# Indicates whether this item should be kept for future iterations or if it's no
# longer a valid pick.
#
# @within
# 	function bingo:card_generation/remove_items
# 	function bingo:card_generation/remove_items/**
#declare score_holder $card_gen/remove_items.keep_item

data modify storage tmp.bingo:card_generation categories set from storage tmp.bingo:card_generation categoriesForRemoval
function bingo:card_generation/remove_items/check_categories

execute if score $card_gen/remove_items.keep_item bingo.tmp matches 1 run data modify storage tmp.bingo:card_generation keptItems append from storage tmp.bingo:card_generation items[-1]

#>
# The current item's weight to adjust the remaining total weight
#
# @private
#declare score_holder $card_gen/remove_items.weight
execute unless score $card_gen/remove_items.keep_item bingo.tmp matches 1 store result score $card_gen/remove_items.weight bingo.tmp run data get storage tmp.bingo:card_generation items[-1].weight
execute unless score $card_gen/remove_items.keep_item bingo.tmp matches 1 run scoreboard players operation $card_gen.total_weight bingo.tmp -= $card_gen/remove_items.weight bingo.tmp


# Keep track of other categories of that item, so that the total weight of that
# category, and the corresponding global item weight can be recalculated.
execute unless score $card_gen/remove_items.keep_item bingo.tmp matches 1 run data modify storage tmp.bingo:card_generation categoriesWithRemovedItem append from storage tmp.bingo:card_generation secondaryCategories[]

data remove storage tmp.bingo:card_generation items[-1]
execute if data storage tmp.bingo:card_generation items[0] run function bingo:card_generation/remove_items