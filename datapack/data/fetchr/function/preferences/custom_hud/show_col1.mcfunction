#> fetchr:preferences/custom_hud/show_col1
#
# Shows the dialog for col1 of custom hud
#
# @within
# 	function fetchr:preferences/custom_hud/show
# 	function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
# @reads storage fetchr:custom_hud currentPlayer.components

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{ "translate": "fetchr.preferences.custom_hud.adjust_col1.title", "bold": true, "color": "green" },\
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

# Move left indicator
# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud hudComponent \
	set from storage fetchr:custom_hud currentPlayer.components[4]
#NEUN_SCRIPT until 65
#execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud move set value '[\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_left.title",\
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
			translate: "fetchr.preferences.custom_hud.adjust_col.move_left.title",\
			color: "#00c3ff",\
			hoverEvent: {\
				action: "show_text",\
				contents: { translate: "fetchr.preferences.custom_hud.adjust_col.move_left_right.description", color: "gold" }\
			}\
		},\
		" ]"\
	]
#NEUN_SCRIPT end

#region Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences/hud filledComponets set value []
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[5]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[6]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[7]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[8]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[9]
data \
	modify storage tmp.fetchr:preferences/hud filledComponets \
	append from storage fetchr:custom_hud currentPlayer.components[10]

data remove storage tmp.fetchr:preferences/hud filledComponets[{ id: "fetchr:empty" }]
#endregion

execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[5] \
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 49" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 49" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 50" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 50" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 51" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 51" }\
		},\
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[5].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[5].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[5] \
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 52" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 52" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 53" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 53" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 54" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 54" }\
		},\
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[4].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[4].name", "interpret": true }\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[5] \
	if data storage tmp.fetchr:preferences/hud filledComponets[4] \
	run tellraw @s [\
		"[ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 49" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 49" }\
		},\
		" ] [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 52" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 52" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 53" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 53" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 54" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 54" }\
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
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" }, " ] [ ", { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "#00c3ff", "hoverEvent": { "action": "show_text", "contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }}, "clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 55" },\ "hover_event": { "action": "show_text", "value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }}, "click_event": { "action": "run_command", "command": "trigger fetchr.pref set 55" }}, " ]", { "storage": "tmp.fetchr:preferences/hud", "nbt": "move", "interpret": true, "clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 56" }, "click_event": { "action": "run_command", "command": "trigger fetchr.pref set 56" }}, " [ ", { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.title", "color": "#00c3ff", "hoverEvent": { "action": "show_text", "contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }}, "clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 57" },\ "hover_event": { "action": "show_text", "value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }}, "click_event": { "action": "run_command", "command": "trigger fetchr.pref set 57" }}, " ] ", { "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].settingsTextComponent", "interpret": true }, { "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[3].name", "interpret": true }]
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 52" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 52" }\
		},\
		" ] [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 55" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 55" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 56" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 56" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 57" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 57" }\
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
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 58" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 58" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 59" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 59" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 60" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 60" }\
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 55" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 55" }\
		},\
		" ] [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 58" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 58" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 59" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 59" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 60" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 60" }\
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
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 61" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 61" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 62" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 62" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 63" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 63" }\
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 58" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 58" }\
		},\
		" ] [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 61" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 61" }\
		},\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 62" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 62" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 63" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 63" }\
		},\
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[1].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[1] \
	if data storage tmp.fetchr:preferences/hud filledComponets[0] \
	run tellraw @s [\
		"[ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.title", "color": "gray" },\
		" ] [ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 64" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 64" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 65" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 65" }\
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 61" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.move_up.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 61" }\
		},\
		" ] [ ",\
		{ "translate": "fetchr.preferences.custom_hud.adjust_col.move_down.title", "color": "gray" },\
		" ]",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "move",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 64" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 64" }\
		},\
		" [ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.adjust_col.remove.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 65" },\
			"hover_event": {\
				"action": "show_text",\
				"value": { "translate": "fetchr.preferences.custom_hud.adjust_col.remove.description", "color": "gold" }\
			},\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 65" }\
		},\
		" ] ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].settingsTextComponent", "interpret": true },\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "filledComponets[0].name", "interpret": true }\
	]

execute \
	unless data storage tmp.fetchr:preferences/hud filledComponets[5] \
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
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 66" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 66" }\
		},\
		" ]"\
	]
execute \
	if data storage tmp.fetchr:preferences/hud filledComponets[5] \
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