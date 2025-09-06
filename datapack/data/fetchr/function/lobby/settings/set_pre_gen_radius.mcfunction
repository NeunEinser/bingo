#> fetchr:lobby/settings/set_pre_gen_radius
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the pre-gen radius setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 8
execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players enable @s fetchr.pre_gen_radius

#NEUN_SCRIPT until 77
#tellraw @s [\
	"\n\n\n\n\n=== ",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.heading",\
		"bold": true,\
		"color": "green"\
	},\
	" ===\n\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.minimal",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 144" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 144" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["250"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 250" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 250" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["500"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 500" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 500" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["750"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 750" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 750" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["1000"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 1000" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 1000" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["1500"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 1500" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 1500" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.radius",\
		"color": "#00c3ff",\
		"with": ["2000"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 2000" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.pre_gen_radius set 2000" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.pre_gen.menu.option.custom",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.pre_gen_radius set " },\
		"click_event": { "action": "suggest_command", "command": "/trigger fetchr.pre_gen_radius set "}\
	},\
	"]"\
]
#NEUN_SCRIPT end

#NEUN_SCRIPT since 77
data modify storage tmp.fetchr:settings/dialog pre_gen_radius set value {\
	pre_gen_radius: 250,\
	exit_callback_setting_trigger: 1,\
	cancel_button_translate: "cancel",\
}

execute \
	if score $pregeneration_radius fetchr.setting_values matches 145.. \
	store result storage tmp.fetchr:settings/dialog pre_gen_radius.pre_gen_radius int 1 \
	run scoreboard players get $pregeneration_radius fetchr.setting_values

execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	store result storage tmp.fetchr:settings/dialog pre_gen_radius.exit_callback_setting_trigger int 1 \
	run scoreboard players get $exit_callback_setting_trigger fetchr.io

execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	run data \
		modify storage tmp.fetchr:settings/dialog pre_gen_radius.cancel_button_translate \
		set value "back"

scoreboard players set @s fetchr.setting_callback 1
execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	run scoreboard players operation @s fetchr.setting_callback = \
		$exit_callback_setting_trigger fetchr.io
scoreboard players reset $exit_callback_setting_trigger fetchr.io

function fetchr:settings/show_pre_gen_radius_dialog \
	with storage tmp.fetchr:settings/dialog pre_gen_radius
#NEUN_SCRIPT end