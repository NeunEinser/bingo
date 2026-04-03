#> fetchr:card_generation/set_item_data
#
# Fills in some slot data to the item
#
# @within function fetchr:card_generation/generate_slot
# @params ::fetchr::storage::card::CardSlot

$data modify storage fetchr:card slots[$(slot_id)].icon_display set value "\u$(icon)"
$data \
	modify storage fetchr:card slots[$(slot_id)].current_font \
	set from storage fetchr:card slots[$(slot_id)].icon_font.actionbar[$(row)]

$execute \
	unless score $concealed_card fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[$(slot_id)].current_display set value [\
		"",\
		{ text: "\u0002", font: "fetchr:space" },\
		"\u$(icon)"\
	]
$execute \
	if data storage fetchr:card slots[$(slot_id)].current_font \
	run function fetchr:card_generation/apply_custom_font \
		with storage fetchr:card slots[$(slot_id)]

$execute \
	if score $concealed_card fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[$(slot_id)].current_display \
		set value { text: "\u0013", font: "fetchr:space" }

# set item to frame
$execute \
	unless score $concealed_card fetchr.state matches 1 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	if score @s fetchr.lobby_card_frame_id matches $(slot_id) \
	run data modify entity @s Item set from storage fetchr:card slots[$(slot_id)].item