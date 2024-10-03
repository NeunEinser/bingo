#> fetchr:card_generation/remove_items/add_category_with_removed_item
#
# Adds entries for categoriesWithRemovedItem for the current item
#
# @within
# 	function fetchr:card_generation/remove_items/add_categories_with_removed_item
# 	function fetchr:card_generation/remove_items/add_category_with_removed_item

data modify entity @s Tags set from storage tmp.fetchr:card_generation stringTesterTagCache
data modify entity @s Tags append from storage tmp.fetchr:card_generation itemCategories[-1].id

#>
# @private
#declare score_holder $card_gen/remove_items.tag_count
execute store result score $card_gen/remove_items.tag_count fetchr.tmp run data get entity @s Tags

execute if score $card_gen/remove_items.tag_count fetchr.tmp > $card_gen.aec_tag_count fetchr.tmp run data modify storage tmp.fetchr:card_generation categoriesWithRemovedItem append from storage tmp.fetchr:card_generation itemCategories[-1]

data remove storage tmp.fetchr:card_generation itemCategories[-1]
execute if data storage tmp.fetchr:card_generation itemCategories[0] run function fetchr:card_generation/remove_items/add_category_with_removed_item