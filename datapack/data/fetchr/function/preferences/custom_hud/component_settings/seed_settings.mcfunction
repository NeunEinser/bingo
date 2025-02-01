#> fetchr:preferences/custom_hud/component_settings/seed_settings
#
# Shows seed menu page
#
# @within function fetchr:preferences/custom_hud/show

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.preferences.custom_hud.component_settings.seed.title",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n",\
	{ "translate": "fetchr.preferences.custom_hud.component_settings.seed.description", "color": "gray" },\
	"\n"\
]

execute \
	unless \
		data storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:seed" }].custom.fetchr{ onlyShowAfterRun: true } \
	run tellraw @s [\
		"[ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.component_settings.seed.only_show_after_run.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": {\
					"translate": "fetchr.preferences.custom_hud.component_settings.seed.only_show_after_run.description",\
					"color": "gold"\
				}\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 75" },\
			"hover_event": {\
				"action": "show_text",\
				"value": {\
					"translate": "fetchr.preferences.custom_hud.component_settings.seed.only_show_after_run.description",\
					"color": "gold"\
				}\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 75" }\
		},\
		" ]"\
	]
execute \
	if \
		data storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:seed" }].custom.fetchr{ onlyShowAfterRun: true } \
	run tellraw @s [\
		"[ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.component_settings.seed.always_show.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": {\
					"translate": "fetchr.preferences.custom_hud.component_settings.seed.always_show.description",\
					"color": "gold"\
				}\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 76" },\
			"hover_event": {\
				"action": "show_text",\
				"value": {\
					"translate": "fetchr.preferences.custom_hud.component_settings.seed.always_show.description",\
					"color": "gold"\
				}\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 76" }\
		},\
		" ]"\
	]

#>
# @private
#declare score_holder $hud/settings/pos_settings.slot
execute \
	store result score $hud/settings/pos_settings.slot fetchr.tmp \
	run data get storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:seed" }].slot_id
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