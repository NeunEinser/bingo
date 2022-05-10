#> bingo:card_generation/remove_items/check_categories
#
# Checks if the current item is in any of the categories from the item that was
# chosen last.
#
# @within
# 	function bingo:card_generation/remove_items
# 	function bingo:card_generation/remove_items/check_categories

data modify storage tmp.bingo:card_generation itemCategories set from storage tmp.bingo:card_generation items[-1].activeCategories
data remove storage tmp.bingo:card_generation secondaryCategories
function bingo:card_generation/remove_items/check_category
data modify storage tmp.bingo:card_generation secondaryCategories append from storage tmp.bingo:card_generation itemCategories[]

data remove storage tmp.bingo:card_generation categories[-1]
execute if score $card_gen/remove_items.keep_item bingo.tmp matches 1 if data storage tmp.bingo:card_generation categories[0] run function bingo:card_generation/remove_items/check_categories