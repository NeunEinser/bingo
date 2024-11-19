#> fetchr:item_detection/handle_item_from_inventory/exec
#
# Finds the exact item stack for clearing
#
# @params
#	slot: #[item_slot] string
#	translation: #[translation_key] string
# @within function fetchr:item_detection/check_and_announce/*

$item replace block 6 0 7 container.0 from entity @s $(slot)
$data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set value '{"translate":"$(translation)"'

execute \
	if items block 6 0 7 container.0 *[minecraft:rarity] \
	unless items block 6 0 7 container.0 *[minecraft:rarity="common"] \
	run function fetchr:item_detection/handle_item_from_inventory/add_rarity_color \
		with storage tmp.fetchr:item_detect

data modify storage tmp.fetchr:item_detect inventory set value []
data \
	modify storage tmp.fetchr:item_detect inventory \
	append from block 6 0 7 Items[0].components.minecraft:bundle_contents[]
data \
	modify storage tmp.fetchr:item_detect inventory \
	append from block 6 0 7 Items[0].components.minecraft:container[].item
data \
	modify storage tmp.fetchr:item_detect inventory \
	append from block 6 0 7 Items[0].components.minecraft:charged_projectiles[]

execute \
	if items block 6 0 7 container.0 *[minecraft:bundle_contents] \
	run item modify block 6 0 7 container.0 {\
		function: "minecraft:set_components",\
		components: { "minecraft:bundle_contents": [] }\
	}
execute \
	if items block 6 0 7 container.0 *[minecraft:container] \
	run item modify block 6 0 7 container.0 {\
		function: "minecraft:set_components",\
		components: { "minecraft:container": [] }\
	}
execute \
	if items block 6 0 7 container.0 *[minecraft:charged_projectiles] \
	run item modify block 6 0 7 container.0 {\
		function: "minecraft:set_components",\
		components: { "minecraft:charged_projectiles": [] }\
	}
data \
	modify storage tmp.fetchr:item_detect item \
	set from block 6 0 7 Items[0]
function fetchr:item_detection/handle_item_from_inventory/add_item_data \
	with storage tmp.fetchr:item_detect

$item modify entity @s $(slot) {\
	function: "minecraft:set_count",\
	count: -1,\
	add: true\
}

data \
	modify block 7 0 7 front_text.messages[0] \
	set from storage tmp.fetchr:item_detect item_text_component
data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set from block 7 0 7 front_text.messages[0]

function fetchr:item_detection/handle_item_from_inventory/send_chat_message \
	with storage tmp.fetchr:item_detect