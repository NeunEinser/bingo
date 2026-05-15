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
				{ translate: "fetchr.settings.points_goal.name" },\
				": ",\
				$(points_goal),\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 14" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.lockout_mode.name" },\
				": ",\
				{ translate: "options.$(lockout_mode)" },\
			],\
			tooltip: { translate: "fetchr.settings.info.takes_effect_after_starting_game" },\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 7" },\
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
		{\
			label: [\
				{ translate: "fetchr.settings.pre_gen.name" },\
				": ",\
				$(pre_gen),\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 15" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.show_seed.name" },\
				": ",\
				{ translate: "options.$(show_seed)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 10" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.allow_spectating.name" },\
				": ",\
				{ translate: "options.$(allow_spectating)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 11" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.operator_only.name" },\
				": ",\
				{ translate: "options.$(operator_only)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 12" },\
		},\
		{\
			label: [\
				{ translate: "fetchr.settings.gamemode.name" },\
				": ",\
				{ translate: "fetchr.settings.gamemode.value.$(gamemode)" },\
			],\
			action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 13" },\
		},\
	],\
	after_action: "none",\
	exit_action: {\
		label: { translate: "gui.back" },\
		action: { type: "minecraft:run_command", command: "trigger fetchr.settings set 2" },\
	},\
}
#NEUN_SCRIPT end