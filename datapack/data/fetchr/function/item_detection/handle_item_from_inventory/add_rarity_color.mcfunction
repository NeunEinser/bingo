#> fetchr:item_detection/handle_item_from_inventory/add_rarity_color
#
# Finds the exact item stack for clearing
#
# @params
#	item_text_component: string
# @within function fetchr:item_detection/handle_item_from_inventory/exec

#NEUN_SCRIPT until 65
#$execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="uncommon"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component \
		set value '$(item_text_component), "color": "yellow"'
#$execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="rare"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component \
		set value '$(item_text_component), "color": "aqua"'
#$execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="epic"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component \
		set value '$(item_text_component), "color": "light_purple"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="uncommon"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component.color \
		set value "yellow"
execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="rare"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component.color \
		set value "aqua"
execute \
	if items block 6 0 7 container.0 *[minecraft:rarity="epic"] \
	run data \
		modify storage tmp.fetchr:item_detect item_text_component.color \
		set value "light_purple"
#NEUN_SCRIPT end

