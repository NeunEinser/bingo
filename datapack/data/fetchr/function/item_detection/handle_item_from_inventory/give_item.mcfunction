#> fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory
#
# Gives the player one specific item
#
# @params
# 	command_argument: #[item] string
# @within function fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory

$give @s $(command_argument) $(count)