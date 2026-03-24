#> fetchr:init/items/add_icon
#
# Adds the icon for debug
#
# @params ::fetchr::item::Item
# @within
# 	function fetchr:init/items/second_pass

$data \
	modify storage tmp.fetchr:init initialized_items[-1].item.components.minecraft:lore \
	append value { text: "\u$(icon)", color: "white", italic: false, font: "fetchr:actionbar_card/row1" }

