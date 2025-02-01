#> fetchr:preferences/custom_hud/component_settings/player_position_settings
#
# Shows player position menu page
#
# @within function fetchr:preferences/custom_hud/show

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.player_position.title",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.player_position.description",\
		"color": "gray"\
	},\
	"\n"\
]

execute \
	if data \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ chunkCoordinatesOnTreasureMap: true } \
	run tellraw @s [\
		"[ ",\
			{\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_position.disable_chunk_coordinates.title",\
				"color":\
				"#00c3ff",\
				"hoverEvent": {\
					"action": "show_text",\
					"contents": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.disable_chunk_coordinates.description",\
						"color": "gold"\
					}\
				},\
				"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 73" },\
				"hover_event": {\
					"action": "show_text",\
					"value": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.disable_chunk_coordinates.description",\
						"color": "gold"\
					}\
				},\
				"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 73" }\
			},\
		" ]"\
	]
execute \
	unless data \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ chunkCoordinatesOnTreasureMap: true } \
	run tellraw @s [\
		"[ ",\
			{\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_position.enable_chunk_coordinates.title",\
				"color":\
				"#00c3ff",\
				"hoverEvent": {\
					"action": "show_text",\
					"contents": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.enable_chunk_coordinates.description",\
						"color": "gold"\
					}\
				},\
				"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 71" },\
				"hover_event": {\
					"action": "show_text",\
					"value": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.enable_chunk_coordinates.description",\
						"color": "gold"\
					}\
				},\
				"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 71" }\
			},\
		" ]"\
	]
execute \
	unless data \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ iconType: "compass" } \
	run tellraw @s [\
		"[ ",\
			{\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_compass_icon.title",\
				"color":\
				"#00c3ff",\
				"hoverEvent": {\
					"action": "show_text",\
					"contents": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_compass_icon.description",\
						"color": "gold"\
					}\
				},\
				"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 77" },\
				"hover_event": {\
					"action": "show_text",\
					"value": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_compass_icon.description",\
						"color": "gold"\
					}\
				},\
				"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 77" }\
			},\
		" ]"\
	]
execute \
	if data \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ iconType: "compass" } \
	run tellraw @s [\
		"[ ",\
			{\
				"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_text_icon.title",\
				"color":\
				"#00c3ff",\
				"hoverEvent": {\
					"action": "show_text",\
					"contents": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_text_icon.description",\
						"color": "gold"\
					}\
				},\
				"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 78" },\
				"hover_event": {\
					"action": "show_text",\
					"value": {\
						"translate": "fetchr.preferences.custom_hud.component_settings.player_position.use_text_icon.description",\
						"color": "gold"\
					}\
				},\
				"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 78" }\
			},\
		" ]"\
	]

#>
# @private
#declare score_holder $hud/settings/pos_settings.slot
execute \
	store result score $hud/settings/pos_settings.slot fetchr.tmp \
	run data get storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }].slot_id
execute \
	if score $hud/settings/pos_settings.slot fetchr.tmp matches 0..4 \
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
	if score $hud/settings/pos_settings.slot fetchr.tmp matches 5..10 \
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