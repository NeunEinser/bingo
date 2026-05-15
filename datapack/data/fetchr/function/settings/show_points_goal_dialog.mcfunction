#> fetchr:settings/show_points_goal_dialog
#
# Function that is run to show the points goal dialog
#
# @within function fetchr:settings/prepare_and_show_game_settings

#NEUN_SCRIPT since 77 until 79
#$dialog show @s {\
	type: "minecraft:multi_action_input_form",\
	title: { translate: "fetchr.settings.points_goal.name" },\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: { translate: "fetchr.settings.points_goal.description" }\
		}\
	],\
	inputs: [\
		{\
			type: "minecraft:number_range",\
			start: 5,\
			end: 60,\
			step: 5,\
			steps: 11,\
			initial: $(game_end),\
			key: "end_time",\
			label: { translate: "fetchr.settings.points_goal.input.end_time" }\
		}\
	],\
	actions: [\
		{\
			id: "set_time",\
			label: { translate: "fetchr.settings.points_goal.action.set_time" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.points_race_minutes set \x24(end_time)"\
			}\
		},\
		{\
			id: "-1",\
			label: { translate: "fetchr.settings.points_goal.action.disable" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.points_race_minutes set \x24(action)"\
			}\
		},\
		{\
			id: "settings",\
			label: { translate: "gui.$(cancel_button_translate)" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.\x24(action) set $(exit_callback_setting_trigger)",\
			},\
		},\
	],\
}
#NEUN_SCRIPT end

#NEUN_SCRIPT since 79
$dialog show @s {\
	type: "minecraft:multi_action",\
	title: { translate: "fetchr.settings.points_goal.name" },\
	pause: false,\
	after_action: "none",\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: { translate: "fetchr.settings.points_goal.description" }\
		}\
	],\
	inputs: [\
		{\
			type: "minecraft:number_range",\
			start: 5,\
			end: 60,\
			step: 5,\
			initial: $(game_end),\
			key: "end_time",\
			label: { translate: "fetchr.settings.points_goal.input.end_time" }\
		}\
	],\
	actions: [\
		{\
			label: { translate: "fetchr.settings.points_goal.action.set_time" },\
			action: {\
				type: "minecraft:dynamic/run_command",\
				template: "trigger fetchr.points_race_minutes set \x24(end_time)"\
			},\
		},\
		{\
			label: { translate: "fetchr.settings.points_goal.action.disable" },\
			action: {\
				type: "minecraft:run_command",\
				command: "trigger fetchr.points_race_minutes set -1"\
			},\
		},\
	],\
	exit_action: {\
		label: { translate: "gui.$(cancel_button_translate)" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.settings set $(exit_callback_setting_trigger)",\
		},\
	},\
}
#NEUN_SCRIPT end