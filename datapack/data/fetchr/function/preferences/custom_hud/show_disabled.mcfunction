#> fetchr:preferences/custom_hud/show_disabled
#
# Shows the dialog for enableing disabled hud components
#
# @within
# 	function fetchr:preferences/custom_hud/show
# 	function fetchr:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered fetchr.pref
# @reads
# 	storage fetchr:custom_hud currentPlayer.components
# 	storage fetchr:custom_hud components

execute \
	if score @s fetchr.pref matches 6 \
	run scoreboard players set @s fetchr.menu_page 0
execute \
	if score @s fetchr.pref matches 7 \
	run scoreboard players remove @s fetchr.menu_page 1
execute \
	if score @s fetchr.pref matches 8 \
	run scoreboard players add @s fetchr.menu_page 1

scoreboard players set $preferences/hud.page fetchr.tmp 0
scoreboard players set $preferences/hud.element fetchr.tmp 0
data modify storage io.fetchr:preferences components set from storage fetchr:custom_hud components
function #fetchr:preferences/custom_hud/filter_disabled
data modify storage tmp.fetchr:preferences/hud pageElements set value []
data modify storage tmp.fetchr:preferences/hud playerComponents set from storage fetchr:custom_hud currentPlayer.components
data remove storage tmp.fetchr:preferences/hud playerComponents[{ id: "fetchr:empty" }]
function fetchr:preferences/custom_hud/select_page

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{ "translate": "fetchr.preferences.custom_hud.add_disabled.title", "bold": true, "color": "green" },\
	" ===\n\n",\
	{ "translate": "fetchr.preferences.custom_hud.add_disabled.description", "color": "gray" },\
	"\n"\
]

#NEUN_SCRIPT until 65
#data modify storage tmp.fetchr:preferences/hud addCol0 set value '""'
#data modify storage tmp.fetchr:preferences/hud addCol1 set value '""'
#data modify storage tmp.fetchr:preferences/hud col01Space set value '""'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage tmp.fetchr:preferences/hud addCol0 set value ""
data modify storage tmp.fetchr:preferences/hud addCol1 set value ""
data modify storage tmp.fetchr:preferences/hud col01Space set value ""
#NEUN_SCRIPT end

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud hudComponent \
	set from storage fetchr:custom_hud currentPlayer.components[4]
#NEUN_SCRIPT until 65
#execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud addCol0 set value '[\
		"[ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.add_disabled.add_col0.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.add_disabled.add.description", "color": "gold" }\
			}\
		},\
		" ]"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud addCol0 set value [\
		"[ ",\
		{\
			translate: "fetchr.preferences.custom_hud.add_disabled.add_col0.title",\
			color: "#00c3ff",\
			hoverEvent: {\
				action: "show_text",\
				contents: { translate: "fetchr.preferences.custom_hud.add_disabled.add.description", color: "gold" }\
			}\
		},\
		" ]"\
	]
#NEUN_SCRIPT end
# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud hudComponent \
	set from storage fetchr:custom_hud currentPlayer.components[10]
#NEUN_SCRIPT until 65
#execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud addCol1 set value '[\
		"[ ",\
		{\
			"translate": "fetchr.preferences.custom_hud.add_disabled.add_col1.title",\
			"color": "#00c3ff",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": { "translate": "fetchr.preferences.custom_hud.add_disabled.add.description", "color": "gold" }\
			}\
		},\
		" ]"\
	]'
#execute \
	unless data storage tmp.fetchr:preferences/hud { addCol0: '""' } \
	unless data storage tmp.fetchr:preferences/hud { addCol1: '""' } \
	run data modify storage tmp.fetchr:preferences/hud col01Space set value '" "'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if data storage tmp.fetchr:preferences/hud hudComponent{ id: "fetchr:empty" } \
	run data modify storage tmp.fetchr:preferences/hud addCol1 set value [\
		"[ ",\
		{\
			translate: "fetchr.preferences.custom_hud.add_disabled.add_col1.title",\
			color: "#00c3ff",\
			hoverEvent: {\
				action: "show_text",\
				contents: { translate: "fetchr.preferences.custom_hud.add_disabled.add.description", color: "gold" }\
			}\
		},\
		" ]"\
	]
execute \
	unless data storage tmp.fetchr:preferences/hud { addCol0: "" } \
	unless data storage tmp.fetchr:preferences/hud { addCol1: "" } \
	run data modify storage tmp.fetchr:preferences/hud col01Space set value " "
#NEUN_SCRIPT end

tellraw @s [\
	{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[0].name", "interpret": true },\
	" ",\
	{\
		"storage": "tmp.fetchr:preferences/hud",\
		"nbt": "addCol0",\
		"interpret": true,\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 12" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 12" }\
	},\
	{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
	{\
		"storage": "tmp.fetchr:preferences/hud",\
		"nbt": "addCol1",\
		"interpret": true,\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 13" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 13" }\
	}\
]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[1] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[1].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 14" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 14" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 15" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 15" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[2] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[2].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 16" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 16" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 17" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 17" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[3] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[3].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 18" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 18" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 19" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 19" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[4] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[4].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 20" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 20" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 21" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 21" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[5] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[5].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 22" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 22" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 23" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 23" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[6] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[6].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 24" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 24" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 25" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 25" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[7] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[7].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 26" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 26" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 27" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 27" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[8] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[8].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 28" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 28" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 29" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 29" }\
		}\
	]
execute \
	if data storage tmp.fetchr:preferences/hud pageElements[9] \
	run tellraw @s [\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "pageElements[9].name", "interpret": true },\
		" ",\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol0",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 30" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 30" }\
		},\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "col01Space", "interpret": true },\
		{\
			"storage": "tmp.fetchr:preferences/hud",\
			"nbt": "addCol1",\
			"interpret": true,\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 31" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 31" }\
		}\
	]

#> 
# @private
#declare score_holder $preferences/hud.enabled_count
execute \
	store result score $preferences/hud.enabled_count fetchr.tmp \
	run data get storage tmp.fetchr:preferences/hud playerComponents
#> 
# @private
#declare score_holder $preferences/hud.page_count
execute \
	store result score $preferences/hud.page_count fetchr.tmp \
	run data get storage fetchr:custom_hud components
scoreboard players operation $preferences/hud.page_count fetchr.tmp -= $preferences/hud.enabled_count fetchr.tmp
scoreboard players remove $preferences/hud.page_count fetchr.tmp 1
scoreboard players operation $preferences/hud.page_count fetchr.tmp /= 10 fetchr.const

#NEUN_SCRIPT until 65
#data \
	modify storage tmp.fetchr:preferences/hud prev \
	set value '[ "[ ", { "translate": "fetchr.preferences.previous", "color": "gray" }, " ]" ]'
#data \
	modify storage tmp.fetchr:preferences/hud next \
	set value '[ "[ ", { "translate": "fetchr.preferences.next", "color": "gray" }, " ]" ]'

#execute \
	if score @s fetchr.menu_page matches 1.. \
	run data modify storage tmp.fetchr:preferences/hud prev set value '[\
		"[ ",\
		{\
			"translate": "fetchr.preferences.previous",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 7" }\
		},\
		" ]"\
	]'
#execute \
	if score @s fetchr.menu_page < $preferences/hud.page_count fetchr.tmp \
	run data modify storage tmp.fetchr:preferences/hud next set value '[\
		"[ ",\
		{\
			"translate": "fetchr.preferences.next",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 8" }\
		},\
		" ]"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify storage tmp.fetchr:preferences/hud prev \
	set value [ "[ ", { translate: "fetchr.preferences.previous", color: "gray" }, " ]" ]
data \
	modify storage tmp.fetchr:preferences/hud next \
	set value [ "[ ", { translate: "fetchr.preferences.next", color: "gray" }, " ]" ]

execute \
	if score @s fetchr.menu_page matches 1.. \
	run data modify storage tmp.fetchr:preferences/hud prev set value [\
		"[ ",\
		{\
			translate: "fetchr.preferences.previous",\
			color: "#00c3ff",\
			clickEvent: { action: "run_command", value: "/trigger fetchr.pref set 7" }\
		},\
		" ]"\
	]
execute \
	if score @s fetchr.menu_page < $preferences/hud.page_count fetchr.tmp \
	run data modify storage tmp.fetchr:preferences/hud next set value [\
		"[ ",\
		{\
			translate: "fetchr.preferences.next",\
			color: "#00c3ff",\
			clickEvent: { action: "run_command", value: "/trigger fetchr.pref set 8" }\
		},\
		" ]"\
	]
#NEUN_SCRIPT end

scoreboard players add $preferences/hud.page_count fetchr.tmp 1
scoreboard players operation $preferences/hud.page fetchr.tmp = @s fetchr.menu_page
scoreboard players add $preferences/hud.page fetchr.tmp 1
#NEUN_SCRIPT until 65
#execute \
	unless data storage tmp.fetchr:preferences/hud {\
		prev: '[ "[ ", { "translate": "fetchr.preferences.previous", "color": "gray" }, " ]" ]',\
		next: '[ "[ ", { "translate": "fetchr.preferences.next", "color": "gray" }, " ]" ]'\
	} \
	run tellraw @s [\
		"\n",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "prev", "interpret": true },\
		" ",\
		{ "storage": "tmp.fetchr:preferences/hud", "nbt": "next", "interpret": true },\
		" ",\
		{\
			"translate": "fetchr.preferences.page",\
			"with": [\
				{ "score": { "name": "$preferences/hud.page", "objective": "fetchr.tmp" }},\
				{ "score": { "name": "$preferences/hud.page_count", "objective": "fetchr.tmp" }}\
			]\
		}\
	]
#NEUN_SCRIPT end
#NEUN_SCRIPT until 65
execute \
	unless data storage tmp.fetchr:preferences/hud {\
		prev: [ "[ ", { translate: "fetchr.preferences.previous", color: "gray" }, " ]" ],\
		next: [ "[ ", { translate: "fetchr.preferences.next", color: "gray" }, " ]" ]\
	} \
	run tellraw @s [\
		"\n",\
		{ storage: "tmp.fetchr:preferences/hud", nbt: "prev", interpret: true },\
		" ",\
		{ storage: "tmp.fetchr:preferences/hud", nbt: "next", interpret: true },\
		" ",\
		{\
			translate: "fetchr.preferences.page",\
			with: [\
				{ score: { name: "$preferences/hud.page", objective: "fetchr.tmp" }},\
				{ score: { name: "$preferences/hud.page_count", objective: "fetchr.tmp" }}\
			]\
		}\
	]
#NEUN_SCRIPT end

tellraw @s [\
	"\n[ ",\
	{\
		"translate": "fetchr.preferences.back",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pref set 5" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pref set 5" }\
	},\
	" ]"\
]