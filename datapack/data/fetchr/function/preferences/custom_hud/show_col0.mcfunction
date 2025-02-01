#> fetchr:preferences/custom_hud/show_col0
#
# Shows the dialog for col0 of custom hud
#
# @within
# 	function fetchr:preferences/custom_hud/show
# 	function fetchr:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered fetchr.pref
# @reads storage fetchr:custom_hud currentPlayer.components

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

#NEUN_SCRIPT until 65
#data modify storage tmp.fetchr:preferences/hud move set value '""'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage tmp.fetchr:preferences/hud move set value ""
#NEUN_SCRIPT end

# Move right indicator
# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud hudComponent \
	set from storage fetchr:custom_hud currentPlayer.components[10]
#NEUN_SCRIPT until 65
#execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud move set value '[\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_right.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_left_right.description", "color": "gold" }\
			}\
		},\
		" ]"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud move set value [\
		" [ ",\
		{\
			translate: "fetchr.preferences.custom_hud.adjust_col.move_right.title",\
			color: "#00c3ff",\
			hover_event: {\
				action: "show_text",\
				value: { translate: "fetchr.preferences.custom_hud.adjust_col.move_left_right.description", color: "gold" }\
			}\
		},\
		" ]"\
	]
#NEUN_SCRIPT end

#region Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences/hud filledComponets set value []
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[0]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[1]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[2]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[3]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[4]

data remove storage tmp.fetchr:preferences/hud filledComponets[{ id: "fetchr:empty" }]
#endregion

execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[4] \
	run tellraw @s [\
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 33" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 33" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[4].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[4].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[4] \
	if data storage tmp.fetchr:preferences/hud filledComponets[3] \
	run tellraw @s [\
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 36" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 36" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[4] \
	if data storage tmp.fetchr:preferences/hud filledComponets[3] \
	run tellraw @s [\
		"[ ",\
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
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 36" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 36" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[3] \
	if data storage tmp.fetchr:preferences/hud filledComponets[2] \
	run tellraw @s [\
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 39" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 39" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[2].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[2].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[3] \
	if data storage tmp.fetchr:preferences/hud filledComponets[2] \
	run tellraw @s [\
		"[ ",\
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
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 39" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 39" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[2].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[2].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[2] \
	if data storage tmp.fetchr:preferences/hud filledComponets[1] \
	run tellraw @s [\
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 42" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 42" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[2] \
	if data storage tmp.fetchr:preferences/hud filledComponets[1] \
	run tellraw @s [\
		"[ ",\
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
		" ] [ ",\
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
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 42" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 42" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[1] \
	if data storage tmp.fetchr:preferences/hud filledComponets[0] \
	run tellraw @s [ \
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 44" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 44" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[1] \
	if data storage tmp.fetchr:preferences/hud filledComponets[0] \
	run tellraw @s [\
		"[ ",\
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
		" ] [ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 44" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 44" }\
		},\
		" [ ",\
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
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[4] \
	run tellraw @s [\
		"\n[ ",\
		 {\
		 	"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
		},\
		" ] [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.add_spacer",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 46" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 46" }\
		},\
		" ]"\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[4] \
	run tellraw @s [\
		"\n[ ",\
		{\
			"translate": "fetchr.preferences.back",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
		},\
		" ] [ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.add_spacer", "color": "gray" },\
		" ]"\
	]