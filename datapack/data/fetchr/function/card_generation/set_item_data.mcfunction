#> fetchr:card_generation/set_item_data
#
# Fills in some slot data to the item
#
# @within function fetchr:card_generation/generate_slot
# @params ::fetchr::storage::card::CardSlot

#NEUN_SCRIPT until 65
#$data modify storage fetchr:card slots[-1].icon_display set value '"\\u$(icon)"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
$data modify storage fetchr:card slots[-1].icon_display set value "\u$(icon)"
#NEUN_SCRIPT end
$data \
	modify storage fetchr:card slots[-1].current_font \
	set from storage fetchr:card slots[-1].icon_font.actionbar[$(row)]

#NEUN_SCRIPT until 65
#$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display set value '[\
		"",\
		{ "text": "\\u0002", "font": "fetchr:space" },\
		"\\u$(icon)"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display set value [\
		"",\
		{ text: "\u0002", font: "fetchr:space" },\
		"\u$(icon)"\
	]
#NEUN_SCRIPT end
execute \
	if data storage fetchr:card slots[-1].current_font \
	run function fetchr:card_generation/apply_custom_font \
		with storage fetchr:card slots[-1]

#NEUN_SCRIPT until 65
#execute \
	if score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display \
		set value '{ "text": "\\u0013", "font": "fetchr:space" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display \
		set value { text: "\u0013", font: "fetchr:space" }
#NEUN_SCRIPT end

execute \
	store result storage fetchr:card slots[-1].slot_id byte 1 \
	run scoreboard players get $card_gen.slot fetchr.tmp

# set item to frame
execute \
	unless score $blind_mode fetchr.state matches 1 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	if score @s fetchr.lobby_card_frame_id = $card_gen.slot fetchr.tmp \
	run data modify entity @s Item set from storage tmp.fetchr:card_generation items[-1].item