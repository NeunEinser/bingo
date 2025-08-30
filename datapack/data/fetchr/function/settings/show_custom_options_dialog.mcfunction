#> fetchr:settings/show_custom_options_dialog
#
# Function that is run to show the settings dialog
#
# @within function fetchr:settings/prepare_and_show_custom_options

$dialog show @s {\
	type: "minecraft:multi_action",\
	title: { "translate": "fetchr.settings.dialog.custom_options.settings.title" },\
	pause: false,\
	actions: [\
		{\
			label: [\
				{ translate: "fetchr.lobby.settings.concealed_card.dialog.title" },\
				": ",\
				{ translate: "options.$(concealed_card)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 6" },\
		},\
	],\
	after_action: "none",\
	exit_action: {\
		label: { translate: "gui.back" },\
		action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 2" },\
	},\
}