#> fetchr:settings/show_game_settings_dialog
#
# Function that is run to show the settings dialog
#
# @within function fetchr:settings/prepare_and_show_game_settings

#NEUN_SCRIPT since 79
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
				{ translate: "fetchr.settings.target_time.name" },\
				": ",\
				$(target_time),\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 14" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.timer_method.name" },\
				": ",\
				{ translate: "fetchr.settings.timer_method.value.$(timer_method)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 8" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.paused_time.name" },\
				": ",\
				{ translate: "options.$(paused_time)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 9" },\
		},\
	],\
	after_action: "none",\
	exit_action: {\
		label: { translate: "gui.back" },\
		action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 2" },\
	},\
}
#NEUN_SCRIPT end