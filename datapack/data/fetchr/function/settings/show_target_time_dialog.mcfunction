#> fetchr:settings/show_target_time_dialog
#
# Function that is run to show the target time dialog
#
# @within function fetchr:settings/prepare_and_show_game_settings

#NEUN_SCRIPT since 77 until 79
#$dialog show @s {\
	type: "minecraft:multi_action_input_form",\
	title: { translate: "fetchr.settings.target_time.name" },\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: [{ translate: "fetchr.settings.target_time.description" }, "\n"]\
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
			label: { translate: "fetchr.settings.target_time.input.end_time" }\
		}\
	],\
	actions: [\
		{\
			id: "set_time",\
			label: { translate: "fetchr.settings.target_time.action.set_time" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.target_time_minutes set \x24(end_time)"\
			}\
		},\
		{\
			id: "-1",\
			label: { translate: "fetchr.settings.target_time.action.disable" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.target_time_minutes set \x24(action)"\
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
	title: { translate: "fetchr.settings.target_time.name" },\
	pause: false,\
	after_action: "none",\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: [{ translate: "fetchr.settings.target_time.description" }, "\n"]\
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
			label: { translate: "fetchr.settings.target_time.input.end_time" }\
		}\
	],\
	actions: [\
		{\
			label: { translate: "fetchr.settings.target_time.action.set_time" },\
			action: {\
				type: "minecraft:dynamic/run_command",\
				template: "trigger fetchr.target_time_minutes set \x24(end_time)"\
			},\
		},\
		{\
			label: { translate: "fetchr.settings.target_time.action.disable" },\
			action: {\
				type: "minecraft:run_command",\
				command: "trigger fetchr.target_time_minutes set -1"\
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