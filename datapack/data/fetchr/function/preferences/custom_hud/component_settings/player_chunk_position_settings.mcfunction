#> fetchr:preferences/custom_hud/component_settings/player_chunk_position_settings
#
# Shows player chunk position menu page
#
# @within function fetchr:preferences/custom_hud/show

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.player_chunk_position.title",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.player_chunk_position.description",\
		"color": "gray"\
	},\
	"\n\n[ ",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.player_chunk_position.merge_with_pos.title",\
		"color": "#00c3ff",\
		"hoverEvent": {\
			"action": "show_text",\
			"contents": {\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_chunk_position.merge_with_pos.description", \
				"color": "gold"\
			}\
		},\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 71" },\
		"hover_event": {\
			"action": "show_text",\
			"value": {\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_chunk_position.merge_with_pos.description", \
				"color": "gold"\
			}\
		},\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 71" }\
	},\
	" ]"\
]

#>
# @private
#declare score_holder $hud/settings/chnk_pos_settings.slot
execute \
	store result score $hud/settings/chnk_pos_settings.slot fetchr.tmp \
	run data get storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_chunk_position" }].slot_id
execute \
	if score $hud/settings/chnk_pos_settings.slot fetchr.tmp matches 0..4 \
	run tellraw @s [\
		"\n[ ",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 9" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 9" }\
		},\
		" ]"\
	]
execute \
	if score $hud/settings/chnk_pos_settings.slot fetchr.tmp matches 5..10 \
	run tellraw @s [\
		"\n[ ",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 10" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 10" }\
		},\
		" ]"\
	]