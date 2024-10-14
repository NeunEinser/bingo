#> fetchr:card_generation/handle_removed_items/add_category_with_removed_item
#
# Add removed category and update weight
#
# @within
# 	function fetchr:card_generation/handle_removed_items/exec
# 	function fetchr:card_generation/handle_removed_items/add_category_with_removed_item

data remove storage tmp.fetchr:card_generation category
$data modify storage tmp.fetchr:card_generation category \
	set from storage tmp.fetchr:card_generation categories_with_removed_item[{id: "$(id)"}]
$data remove storage tmp.fetchr:card_generation categories_with_removed_item[{id: "$(id)"}]

execute \
	unless data storage tmp.fetchr:card_generation category \
	run data modify storage tmp.fetchr:card_generation category \
		set from storage tmp.fetchr:card_generation item_categories[-1]

execute \
	store result score $card_gen/removed_item_cat.total_weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation category.total_item_weight
execute \
	store result score $card_gen/removed_item_cat.item_weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation item_categories[-1].weight
execute \
	store result storage tmp.fetchr:card_generation category.total_item_weight int 1 \
	run scoreboard players operation $card_gen/removed_item_cat.total_weight fetchr.tmp \
		-= $card_gen/removed_item_cat.item_weight fetchr.tmp
data modify storage tmp.fetchr:card_generation categories_with_removed_item \
	append from storage tmp.fetchr:card_generation category

data remove storage tmp.fetchr:card_generation item_categories[-1]
execute \
	if data storage tmp.fetchr:card_generation item_categories[0] \
	run function fetchr:card_generation/handle_removed_items/add_category_with_removed_item \
		with storage tmp.fetchr:card_generation item_categories[-1]