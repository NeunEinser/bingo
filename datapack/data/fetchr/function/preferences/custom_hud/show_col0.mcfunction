#> fetchr:preferences/custom_hud/show_col0
#
# Shows the dialog for col0 of custom hud
#
# @within
# 	function fetchr:preferences/custom_hud/show
# 	function fetchr:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered fetchr.pref
# @reads storage fetchr:custom_hud current_player.components

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.preferences.custom_hud.adjust_col0.title",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n",\
	{ "translate": "fetchr.preferences.custom_hud.adjust_col.description", "color": "gray" },\
	"\n"\
]

#NEUN_SCRIPT until 69
#data modify storage tmp.fetchr:preferences/hud move set value '""'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify storage tmp.fetchr:preferences/hud move set value ""
#NEUN_SCRIPT end

# Move right indicator
# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud component \
	set from storage fetchr:custom_hud current_player.components[10]
#NEUN_SCRIPT until 69
#execute \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud move set value '[\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_right.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_left_right.description", "color": "gold" }\
			}\
		},\
		"]"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud move set value [\
		" [",\
		{\
			translate: "fetchr.preferences.custom_hud.adjust_col.move_right.title",\
			color: "#00c3ff",\
			hover_event: {\
				action: "show_text",\
				value: { translate: "fetchr.preferences.custom_hud.adjust_col.move_left_right.description", color: "gold" }\
			}\
		},\
		"]"\
	]
#NEUN_SCRIPT end

#region Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences/hud filled_components set value []
data \
	modify storage tmp.fetchr:preferences/hud filled_components \
	append from storage fetchr:custom_hud current_player.components[0]
data \
	modify storage tmp.fetchr:preferences/hud filled_components \
	append from storage fetchr:custom_hud current_player.components[1]
data \
	modify storage tmp.fetchr:preferences/hud filled_components \
	append from storage fetchr:custom_hud current_player.components[2]
data \
	modify storage tmp.fetchr:preferences/hud filled_components \
	append from storage fetchr:custom_hud current_player.components[3]
data \
	modify storage tmp.fetchr:preferences/hud filled_components \
	append from storage fetchr:custom_hud current_player.components[4]

data remove storage tmp.fetchr:preferences/hud filled_components[{ id: "fetchr:empty" }]
#endregion

execute \
	if data storage tmp.fetchr:preferences/hud filled_components[4] \
	run tellraw @s [\
		"[",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		"] [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 32" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 32" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 33" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 33" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 34" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 34" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[4].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[4].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filled_components[4] \
	if data storage tmp.fetchr:preferences/hud filled_components[3] \
	run tellraw @s [\
		"[",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		"] [",\
		{ \
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 35" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 35" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 36" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 36" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 37" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 37" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[3].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[3].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filled_components[4] \
	if data storage tmp.fetchr:preferences/hud filled_components[3] \
	run tellraw @s [\
		"[",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 32" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 32" }\
		},\
		"] [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 35" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 35" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 36" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 36" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 37" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 37" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[3].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[3].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filled_components[3] \
	if data storage tmp.fetchr:preferences/hud filled_components[2] \
	run tellraw @s [\
		"[",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		"] [",\
		{ \
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 38" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 38" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 39" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 39" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 40" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 40" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[2].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[2].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filled_components[3] \
	if data storage tmp.fetchr:preferences/hud filled_components[2] \
	run tellraw @s [\
		"[",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 35" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 35" }\
		},\
		"] [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 38" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 38" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 39" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 39" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 40" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 40" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[2].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[2].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filled_components[2] \
	if data storage tmp.fetchr:preferences/hud filled_components[1] \
	run tellraw @s [\
		"[",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		"] [",\
		{ \
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 41" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 41" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 42" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 42" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 43" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 43" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[1].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[1].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filled_components[2] \
	if data storage tmp.fetchr:preferences/hud filled_components[1] \
	run tellraw @s [\
		"[",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 38" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 38" }\
		},\
		"] [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 41" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 41" }\
		},\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 42" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 42" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 43" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 43" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[1].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[1].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filled_components[1] \
	if data storage tmp.fetchr:preferences/hud filled_components[0] \
	run tellraw @s [ \
		"[",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		"] [",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 44" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 44" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 45" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 45" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[0].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[0].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filled_components[1] \
	if data storage tmp.fetchr:preferences/hud filled_components[0] \
	run tellraw @s [\
		"[",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 41" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 41" }\
		},\
		"] [",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		"]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 44" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 44" }\
		},\
		" [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 45" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 45" }\
		},\
		"] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[0].settings", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filled_components[0].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filled_components[4] \
	run tellraw @s [\
		"\n[",\
		 {\
		 	"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
		},\
		"] [",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.add_spacer",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 46" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 46" }\
		},\
		"]"\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filled_components[4] \
	run tellraw @s [\
		"\n[",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
		},\
		"] [",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.add_spacer", "color": "gray" },\
		"]"\
	]