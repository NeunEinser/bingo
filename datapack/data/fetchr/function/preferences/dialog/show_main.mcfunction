#> fetchr:preferences/dialog/show_main
#
# Shows the main preference menu
#
# @within fetchr:preferences/dialog/exec

tellraw @a { score: { name: "@s", objective: "fetchr.pref_dialog" } }

execute \
	if score @s fetchr.pref_dialog matches 2 \
	if entity @s[tag=!fetchr.enable_manual_gamemode_switch] \
	run tag @s add fetchr.enable_manual_gamemode_switch

execute \
	if score @s fetchr.pref_dialog matches 3 \
	if entity @s[tag=fetchr.enable_manual_gamemode_switch] \
	run tag @s remove fetchr.enable_manual_gamemode_switch


scoreboard players reset @s fetchr.pref_dialog
scoreboard players enable @s fetchr.pref_dialog

execute \
	if entity @s[tag=!fetchr.enable_manual_gamemode_switch] \
	run dialog show @s {\
		type: "minecraft:multi_action",\
		title: { translate: "fetchr.preferences.title" },\
		body: [\
			{\
				type: "minecraft:plain_message",\
				width: 400,\
				contents: { "translate": "fetchr.preferences.description" },\
			},\
		],\
		actions: [\
			{\
				label: [\
					{ translate: "fetchr.preferences.spectator_mode.title" },\
					": ",\
					{ translate: "fetchr.preferences.spectator_mode.enabled" },\
				],\
				width: 300,\
				tooltip: { translate: "fetchr.preferences.spectator_mode.description" },\
				on_click: {\
					action: "run_command",\
					command: "trigger fetchr.pref_dialog set 2",\
				},\
			},\
			{\
				label: { translate: "fetchr.preferences.adjust_components.title" },\
				tooltip: { translate: "fetchr.preferences.adjust_components.description" },\
				on_click: {\
					action: "run_command",\
					command: "trigger fetchr.pref_dialog set 4",\
				},\
			},\
		],\
	}

execute \
	if entity @s[tag=fetchr.enable_manual_gamemode_switch] \
	run dialog show @s {\
		type: "minecraft:multi_action",\
		title: { translate: "fetchr.preferences.title" },\
		body: [\
			{\
				type: "minecraft:plain_message",\
				width: 400,\
				contents: { "translate": "fetchr.preferences.description" },\
			},\
		],\
		actions: [\
			{\
				label: [\
					{ translate: "fetchr.preferences.spectator_mode.title" },\
					": ",\
					{ translate: "fetchr.preferences.spectator_mode.disabled" },\
				],\
				width: 300,\
				tooltip: { translate: "fetchr.preferences.spectator_mode.description" },\
				on_click: {\
					action: "run_command",\
					command: "trigger fetchr.pref_dialog set 3",\
				},\
			},\
		],\
	}