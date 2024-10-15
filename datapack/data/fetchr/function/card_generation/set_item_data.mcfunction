#> fetchr:card_generation/set_item_data
#
# Fills in some slot data to the item
#
# @within function fetchr:card_generation/generate_slot
# @params ::fetchr::storage::card::CardSlot

$data modify storage fetchr:card slots[-1].icon_display set value '"\\u$(icon)"'
$data modify storage fetchr:card slots[-1].current_font \
	set from storage fetchr:card slots[-1].icon_font.actionbar[$(row)]

$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data modify storage fetchr:card slots[-1].current_display set value '[\
		"",\
		{"text":"\\u0002","font":"fetchr:space"},\
		"\\u$(icon)"\
	]'
execute \
	if data storage fetchr:card slots[-1].current_font \
	run function fetchr:card_generation/apply_custom_font \
		with storage fetchr:card slots[-1]

execute \
	if score $blind_mode fetchr.state matches 1 \
	run data modify storage fetchr:card slots[-1].current_display \
		set value '{"text": "\\u0013", "font": "fetchr:space"}'

execute \
	store result storage fetchr:card slots[-1].slot_id byte 1 \
	run scoreboard players get $card_gen.slot fetchr.tmp

# set item to frame
execute \
	unless score $blind_mode fetchr.state matches 1 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	if score @s fetchr.lobby_card_frame_id = $card_gen.slot fetchr.tmp \
	run data modify entity @s Item set from storage tmp.fetchr:card_generation items[-1].item