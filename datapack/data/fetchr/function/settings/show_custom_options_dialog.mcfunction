#> fetchr:settings/show_custom_options_dialog
#
# Function that is run to show the settings dialog
#
# @within function fetchr:settings/prepare_and_show_custom_options

$dialog show @s {\
	type: "minecraft:multi_action",\
	title: { "translate": "fetchr.settings.pause_menu.custom_options.settings.title" },\
	pause: false,\
	actions: [\
		{\
			label: [\
				{ translate: "fetchr.settings.concealed_card.name" },\
				": ",\
				{ translate: "options.$(concealed_card)" },\
			],\
			tooltip: { translate: "fetchr.settings.info.takes_effect_after_generating_new" },\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 6" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.points_goal.name" },\
				": ",\
				$(points_goal),\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 7" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.lockout_mode.name" },\
				": ",\
				{ translate: "options.$(lockout_mode)" },\
			],\
			tooltip: { translate: "fetchr.settings.info.takes_effect_after_starting_game" },\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 8" },\
		},\
	],\
	after_action: "none",\
	exit_action: {\
		label: { translate: "gui.back" },\
		action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 2" },\
	},\
}