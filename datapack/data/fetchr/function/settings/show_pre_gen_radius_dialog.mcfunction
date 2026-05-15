#> fetchr:settings/show_pre_gen_radius_dialog
#
# Function that is run to show the pre gen radius dialog
#
# @within function fetchr:settings/prepare_and_show_game_settings

#NEUN_SCRIPT since 77 until 79
#$dialog show @s {\
	type: "minecraft:multi_action_input_form",\
	title: { translate: "fetchr.settings.pre_gen.name" },\
	pause: false,\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: { translate: "fetchr.settings.pre_gen.description" }\
		}\
	],\
	inputs: [\
		{\
			type: "minecraft:number_range",\
			start: 150,\
			end: 2000,\
			step: 50,\
			steps: 37,\
			initial: $(pre_gen_radius),\
			key: "blocks",\
			label: { translate: "fetchr.settings.pre_gen.input.blocks" }\
		}\
	],\
	actions: [\
		{\
			id: "set_time",\
			label: { translate: "fetchr.settings.pre_gen.action.set_blocks" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.pre_gen_radius set \x24(blocks)"\
			}\
		},\
		{\
			id: "144",\
			label: { translate: "fetchr.settings.pre_gen.action.set_minimal" },\
			on_submit: {\
				type: "minecraft:command_template",\
				template: "trigger fetchr.pre_gen_radius set \x24(action)"\
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
	title: { translate: "fetchr.settings.pre_gen.name" },\
	pause: false,\
	after_action: "none",\
	body: [\
		{\
			type: "minecraft:plain_message",\
			width: 400,\
			contents: { translate: "fetchr.settings.pre_gen.description" }\
		}\
	],\
	inputs: [\
		{\
			type: "minecraft:number_range",\
			start: 150,\
			end: 2000,\
			step: 50,\
			initial: $(pre_gen_radius),\
			key: "blocks",\
			label: { translate: "fetchr.settings.pre_gen.input.blocks" }\
		}\
	],\
	actions: [\
		{\
			label: { translate: "fetchr.settings.pre_gen.action.set_blocks" },\
			action: {\
				type: "minecraft:dynamic/run_command",\
				template: "trigger fetchr.pre_gen_radius set \x24(blocks)"\
			},\
		},\
		{\
			label: { translate: "fetchr.settings.pre_gen.action.set_minimal" },\
			action: {\
				type: "minecraft:run_command",\
				command: "trigger fetchr.pre_gen_radius set 144"\
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