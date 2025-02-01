#> fetchr:preferences/custom_hud/show
#
# Shows the currently selected custom hud menu page
#
# @within
# 	function fetchr:preferences/show
# 	function fetchr:preferences/custom_hud/**
# @context entity Player who triggered fetchr.pref
# @reads
# 	storage fetchr:custom_hud players
# 	storage fetchr:registries preferences.custom_hud
# @writes torage fetchr:custom_hud currentPlayer

#>
# @within function fetchr:preferences/custom_hud/**
#declare storage tmp.fetchr:preferences/hud

data modify storage tmp.fetchr:preferences/hud skippedHuds set value []
function fetchr:preferences/custom_hud/find_player
data modify storage fetchr:custom_hud currentPlayer set from storage tmp.fetchr:preferences/hud skippedHuds[0]
data remove storage tmp.fetchr:preferences/hud skippedHuds[0]

execute \
	if score @s fetchr.pref matches 5 \
	run data \
		modify storage io.fetchr:preferences menuOptions \
		set from storage fetchr:registries preferences.custom_hud
execute \
	if score @s fetchr.pref matches 5 \
	run function #fetchr:preferences/custom_hud
execute \
	if score @s fetchr.pref matches 5 \
	run tellraw @s [\
		"\n\n\n\n\n=== ",\
		{ "translate": "fetchr.preferences.custom_hud.title", "bold": true, "color": "green" },\
		" ===\n\n",\
		{ "translate": "fetchr.preferences.custom_hud.description", "color": "gray" },\
		"\n"\
	]

execute \
	if score @s fetchr.pref matches 6..8 \
	run function fetchr:preferences/custom_hud/show_disabled
execute \
	if score @s fetchr.pref matches 9 \
	run function fetchr:preferences/custom_hud/show_col0
execute \
	if score @s fetchr.pref matches 10 \
	run function fetchr:preferences/custom_hud/show_col1

execute \
	if score @s fetchr.pref matches 12..31 \
	run function fetchr:preferences/custom_hud/add_disabled/exec
execute \
	if score @s fetchr.pref matches 32..46 \
	run function fetchr:preferences/custom_hud/adjust_col/col0
execute \
	if score @s fetchr.pref matches 49..66 \
	run function fetchr:preferences/custom_hud/adjust_col/col1

execute \
	if score @s fetchr.pref matches 70 \
	run function fetchr:preferences/custom_hud/component_settings/player_chunk_position_settings
execute \
	if score @s fetchr.pref matches 71 \
	run function fetchr:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates

execute \
	if score @s fetchr.pref matches 72 \
	run function fetchr:preferences/custom_hud/component_settings/player_position_settings
execute \
	if score @s fetchr.pref matches 73 \
	run function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec
execute \
	if score @s fetchr.pref matches 74 \
	run function fetchr:preferences/custom_hud/component_settings/seed_settings
execute \
	if score @s fetchr.pref matches 75 \
	run function fetchr:preferences/custom_hud/component_settings/only_show_seed_after_completion
execute \
	if score @s fetchr.pref matches 76 \
	run function fetchr:preferences/custom_hud/component_settings/always_show_seed
execute \
	if score @s fetchr.pref matches 77 \
	run function fetchr:preferences/custom_hud/component_settings/show_compass_icon
execute \
	if score @s fetchr.pref matches 78 \
	run function fetchr:preferences/custom_hud/component_settings/show_text_icon
execute \
	if score @s fetchr.pref matches 12..66 \
	run scoreboard players set @s fetchr.update_hud 1

#>
# @api
#declare tag/function fetchr:preferences/custom_hud/adjust_card
execute \
	if score @s fetchr.pref matches 11 \
	run data \
		modify storage io.fetchr:preferences menuOptions \
		set from storage fetchr:registries preferences.adjust_card
execute \
	if score @s fetchr.pref matches 11 \
	run function #fetchr:preferences/custom_hud/adjust_card
execute \
	if score @s fetchr.pref matches 11 \
	run tellraw @s [\
		"\n\n\n\n\n=== ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_card.title", "bold": true, "color": "green" },\
		" ===\n\n", { "translate": "fetchr.preferences.custom_hud.adjust_card.description", "color": "gray" },\
		"\n"\
	]

data modify storage fetchr:custom_hud players append from storage fetchr:custom_hud currentPlayer
data modify storage fetchr:custom_hud players append from storage tmp.fetchr:preferences/hud skippedHuds[]

execute \
	if score @s fetchr.pref matches 67 \
	run scoreboard players set @s fetchr.card_position 0
execute \
	if score @s fetchr.pref matches 68 \
	run scoreboard players set @s fetchr.card_position 8
execute \
	if score @s fetchr.pref matches 69 \
	run scoreboard players set @s fetchr.card_position 9
execute \
	if score @s fetchr.pref matches 67..69 \
	run scoreboard players set $preferences.next_page fetchr.tmp 11
execute \
	if score @s fetchr.pref matches 67..69 \
	run scoreboard players set @s fetchr.update_hud 1

execute \
	if score @s fetchr.pref matches 5 \
	run tellraw @s [\
		"\n[ ",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref" }\
		},\
		" ]"\
	]
execute \
	if score @s fetchr.pref matches 11 \
	run tellraw @s [\
		"\n[ ",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
		},\
		" ]"\
	]