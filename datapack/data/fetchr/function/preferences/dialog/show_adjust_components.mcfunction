#> fetchr:preferences/dialog/show_adjust_components
#
# Shows the main adjust components menu
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

dialog show @s {\
	type: "minecraft:simple_input_form",\
	title: { translate: "fetchr.preferences.title" },\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: { "translate": "fetchr.preferences.description" },\
		},\
	],\
	columns: 2,\
	inputs: [\
		{\
			type: "minecraft:single_option",\
			key: "0",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed"\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates"\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates"\
				},\
				{\
					id: "5",\
					display: "Y Coordinate"\
				},\
			]\
		},\
		{\
			type: "minecraft:single_option",\
			key: "1",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed",\
					initial: true\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates"\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates"\
				},\
				{\
					id: "5",\
					display: "Y Coordinate"\
				},\
			]\
		},\
		{\
			type: "minecraft:single_option",\
			key: "3",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed"\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates",\
					initial: true\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates"\
				},\
				{\
					id: "5",\
					display: "Y Coordinate"\
				},\
			]\
		},\
		{\
			type: "minecraft:single_option",\
			key: "5",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed"\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates"\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates",\
					initial: true\
				},\
				{\
					id: "5",\
					display: "Y Coordinate"\
				},\
			]\
		},\
		{\
			type: "minecraft:single_option",\
			key: "7",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed"\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates"\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates"\
				},\
				{\
					id: "5",\
					display: "Y Coordinate",\
					initial: true\
				},\
			]\
		},\
		{\
			type: "minecraft:single_option",\
			key: "0",\
			label: "",\
			label_visible: false,\
			options:[\
				{\
					id: "0",\
					display: ""\
				},\
				{\
					id: "1",\
					display: "Timer"\
				},\
				{\
					id: "2",\
					display: "Seed"\
				},\
				{\
					id: "3",\
					display: "X/Z Coordinates"\
				},\
				{\
					id: "4",\
					display: "Chunk Coordinates"\
				},\
				{\
					id: "5",\
					display: "Y Coordinate"\
				},\
			]\
		},\
	],\
	action: {\
		id: "submit",\
		label: { translate: "fetchr.lobby.card_generation.from_seed.dialog.submit" },\
		on_submit: {\
			type: "minecraft:command_template",\
			template: "trigger fetchr.seed set $(seed)"\
		}\
	}\
}