#> fetchr:lobby/settings/set_pre_gen_radius
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the pre-gen radius setting
#
# @user
# @context entity Player changing the setting

execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players enable @s fetchr.pre_gen_radius

tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.heading",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.minimal",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 144" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 144" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["250"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 250" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 250" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["500"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 500" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 500" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["750"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 750" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 750" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["1000"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 1000" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 1000" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["1500"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 1500" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 1500" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["2000"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 2000" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 2000" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.pre_gen.menu.option.custom",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.pre_gen_radius set " },\
		"click_event": { "action": "suggest_command", "command": "/trigger fetchr.pre_gen_radius set "}\
	},\
	" ]"\
]