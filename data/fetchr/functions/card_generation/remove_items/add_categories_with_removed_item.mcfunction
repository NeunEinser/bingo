#> fetchr:card_generation/remove_items/add_categories_with_removed_item
#
# Adds entries for categoriesWithRemovedItem for the current item
#
# @within function fetchr:card_generation/remove_items/handle_removed_item

data modify storage tmp.fetchr:card_generation itemCategories set from storage tmp.fetchr:card_generation items[-1].activeCategories
function fetchr:card_generation/remove_items/add_category_with_removed_item