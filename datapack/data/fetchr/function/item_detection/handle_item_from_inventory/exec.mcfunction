#> fetchr:item_detection/handle_item_from_inventory/exec
#
# Finds the exact item stack for clearing
#
# @params
#	slot: #[item_slot] string
#	translation: #[translation_key] string
# @within function fetchr:item_detection/check_and_announce/*

$item replace block 6 0 7 container.0 from entity @s $(slot)
#NEUN_SCRIPT until 65
#$data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set value '{ "translate": "$(translation)"'
#execute \
	if items block 6 0 7 container.0 *[minecraft:rarity] \
	unless items block 6 0 7 container.0 *[minecraft:rarity="common"] \
	run function fetchr:item_detection/handle_item_from_inventory/add_rarity_color \
		with storage tmp.fetchr:item_detect
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
$data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set value { translate: "$(translation)" }
execute \
	if items block 6 0 7 container.0 *[minecraft:rarity] \
	unless items block 6 0 7 container.0 *[minecraft:rarity="common"] \
	run function fetchr:item_detection/handle_item_from_inventory/add_rarity_color
#NEUN_SCRIPT end

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
#NEUN_SCRIPT until 65
#function fetchr:item_detection/handle_item_from_inventory/add_item_data \
	with storage tmp.fetchr:item_detect
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify storage tmp.fetchr:item_detect item_text_component.hover_event \
	set from storage tmp.fetchr:item_detect item
data \
	modify storage tmp.fetchr:item_detect item_text_component.hover_event.action \
	set value "show_item"
#NEUN_SCRIPT end

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

#NEUN_SCRIPT until 65
#function fetchr:item_detection/handle_item_from_inventory/send_chat_message \
	with storage tmp.fetchr:item_detect
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
tellraw @a [\
	"[ ",\
	{\
		text: "≡",\
		color: "#00c3ff",\
		click_event: { action: "run_command", command: "/trigger fetchr.menu" },\
		hover_event: { action: "show_text", value: { translate: "fetchr.game.menu.hover_text" }}\
	},\
	" ] ",\
	{\
		translate: "fetchr.got_item",\
		with: [\
			{ score: { name: "$item_detect/announce.items", objective: "fetchr.tmp" }},\
			{ storage: "neun_einser.timer:display", nbt: "\"hh:mm:ss.s\"", interpret: true },\
			{ selector: "@s" },\
			{ storage: "tmp.fetchr:item_detect", nbt: "item_text_component", interpret: true }\
		]\
	}\
]
#NEUN_SCRIPT end

execute \
	if data storage tmp.fetchr:item_detect inventory[0] \
	run function fetchr:item_detection/handle_item_from_inventory/explode_inner_inventory