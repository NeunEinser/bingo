#> fetchr:init/initialize_hud_components/add_defaults
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/initialize_hud_components/add_defaults

# Need to copy because you can't combine indexed access with conditions like
# hud_components[0]{ preferredColum: 1 } for checking if index 0 specifically
# matches preferedColumn of 1
data modify storage tmp.fetchr:init/hud cur set from storage fetchr:registries hud_components[0]
data remove storage fetchr:registries hud_components[0]

execute \
	unless data storage tmp.fetchr:init/hud cur.icon_separator_align_left \
	run data \
		modify storage tmp.fetchr:init/hud cur.icon_separator_align_left \
		set from storage tmp.fetchr:init/hud cur.icon_separator
execute \
	unless data storage tmp.fetchr:init/hud cur.icon_separator_align_right \
	run data \
		modify storage tmp.fetchr:init/hud cur.icon_separator_align_right \
		set from storage tmp.fetchr:init/hud cur.icon_separator
data remove storage tmp.fetchr:init/hud cur.icon_separator

#NEUN_SCRIPT until 69
#setblock 0 15 0 minecraft:oak_sign{ front_text: { messages: [\
	'[\
		"[",\
			{\
				"storage": "tmp.fetchr:init/hud",\
				"nbt": "cur.settings_click_event",\
				"interpret": true,\
				"color": "#00c3ff",\
				"bold": true,\
				"hoverEvent": {\
					"action": "show_text",\
					"contents": { "translate": "fetchr.preferences.custom_hud.adjust_col.settings.hover_text", "color": "gold" }\
				},\
				"extra": ["⚙"]\
			},\
			"] "\
		]',\
	'""',\
	'""',\
	'""'\
]}}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
setblock 0 15 0 minecraft:oak_sign{ front_text: { messages: [\
	[\
		"[",\
			{\
				storage: "tmp.fetchr:init/hud",\
				nbt: "cur.settings_click_event",\
				interpret: true,\
				color: "#00c3ff",\
				bold: true,\
				hover_event: {\
					action: "show_text",\
					value: { translate: "fetchr.preferences.custom_hud.adjust_col.settings.hover_text", color: "gold" }\
				},\
				extra: ["⚙"]\
			},\
			"] "\
		],\
	"",\
	"",\
	""\
]}}
#NEUN_SCRIPT end
execute \
	if data storage tmp.fetchr:init/hud cur.settings_click_event \
	run data \
		modify storage tmp.fetchr:init/hud cur.settings \
		set from block 0 15 0 front_text.messages[0]
setblock 0 15 0 minecraft:air
data remove storage tmp.fetchr:init/hud cur.settings_click_event

execute \
	if data storage tmp.fetchr:init/hud cur{ default: true, preferred_column: 0 } \
	if data storage tmp.fetchr:init/hud columns[0][4] \
	run data modify storage tmp.fetchr:init/hud unpreferred append from storage tmp.fetchr:init/hud cur
execute \
	if data storage tmp.fetchr:init/hud cur{ default: true, preferred_column: 0 } \
	unless data storage tmp.fetchr:init/hud columns[0][4] \
	run function fetchr:init/initialize_hud_components/add_to_0

execute \
	if data storage tmp.fetchr:init/hud cur{ default: true, preferred_column: 1 } \
	if data storage tmp.fetchr:init/hud columns[1][5] \
	run data modify storage tmp.fetchr:init/hud unpreferred append from storage tmp.fetchr:init/hud cur
execute \
	if data storage tmp.fetchr:init/hud cur{ default: true, preferred_column: 1 } \
	unless data storage tmp.fetchr:init/hud columns[1][5] \
	run function fetchr:init/initialize_hud_components/add_to_1

execute \
	if data storage tmp.fetchr:init/hud cur{ default: true } \
	unless data storage tmp.fetchr:init/hud cur.preferred_column \
	run data \
		modify storage tmp.fetchr:init/hud where_space \
		append from storage tmp.fetchr:init/hud cur
execute \
	unless data storage tmp.fetchr:init/hud cur{ default: true } \
	run data \
		modify storage tmp.fetchr:init/hud not_in_default_selection \
		append from storage tmp.fetchr:init/hud cur

execute \
	if data storage fetchr:registries hud_components[0] \
	run function fetchr:init/initialize_hud_components/add_defaults