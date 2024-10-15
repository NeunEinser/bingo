#> fetchr:card_generation/cleanup_and_next_slot
#
# Performs cleanup after generating a slot. Not called for the last slot.
#
# @within function fetchr:card_generation/generate_slot
# @params ::fetchr::item::ActiveItem

$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data modify block 7 0 7 front_text.messages[0] set value '[\
		"",\
		{"text": "\\u0002", "font": "fetchr:space"},\
		"\\u$(icon)"\
	]'
execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data modify storage fetchr:card slots[-1].current_display \
		set from block 7 0 7 front_text.messages[0]
execute \
	if score $blind_mode fetchr.state matches 1 \
	run data modify storage fetchr:card slots[-1].current_display \
		set value '{"text": "\\u0013", "font": "fetchr:space"}'

execute \
	store result storage fetchr:card slots[-1].slot_id int 1 \
	run scoreboard players get $card_gen.slot fetchr.tmp

# set item to frame
execute \
	unless score $blind_mode fetchr.state matches 1 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	if score @s fetchr.lobby_card_frame_id = $card_gen.slot fetchr.tmp \
	run data modify entity @s Item set from storage tmp.fetchr:card_generation items[-1].item