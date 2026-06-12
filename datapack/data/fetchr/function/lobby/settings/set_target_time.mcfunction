#> fetchr:lobby/settings/set_target_time
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the target time setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 4
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players enable @s fetchr.target_time_minutes

#NEUN_SCRIPT until 77
#tellraw @s [\
	"\n\n\n\n\n=== ",\
	{ "translate": "fetchr.settings.target_time.name", "bold": true, "color": "green" },\
	" ===\n\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.off",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set -1" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set -1" }\
	}\
	, "]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["10"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 10" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 10" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["15"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 15" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 15" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["20"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 20" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 20" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["25"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 25" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 25" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["30"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 30" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 30" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["40"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 40" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 40" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["45"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 45" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 45" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["60"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.target_time_minutes set 60" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.target_time_minutes set 60" }\
	},\
	"]\n[",\
	{\
		"translate": "fetchr.settings.target_time.menu.option.custom",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.target_time_minutes set "},\
		"click_event": { "action": "suggest_command", "command": "/trigger fetchr.target_time_minutes set "}\
	},\
	"]"\
]
#NEUN_SCRIPT end

#NEUN_SCRIPT since 77
data modify storage tmp.fetchr:settings/dialog target_time set value {\
	game_end: 25,\
	exit_callback_setting_trigger: 1,\
	cancel_button_translate: "cancel",\
}

execute \
	if score $target_time_announcement_minutes fetchr.setting_values matches 1.. \
	store result storage tmp.fetchr:settings/dialog target_time.game_end int 1 \
	run scoreboard players get $target_time_announcement_minutes fetchr.setting_values

execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	store result storage tmp.fetchr:settings/dialog target_time.exit_callback_setting_trigger int 1 \
	run scoreboard players get $exit_callback_setting_trigger fetchr.io

execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	run data \
		modify storage tmp.fetchr:settings/dialog target_time.cancel_button_translate \
		set value "back"

scoreboard players set @s fetchr.setting_callback 1
execute \
	if score $exit_callback_setting_trigger fetchr.io matches 1.. \
	run scoreboard players operation @s fetchr.setting_callback = \
		$exit_callback_setting_trigger fetchr.io
scoreboard players reset $exit_callback_setting_trigger fetchr.io

function fetchr:settings/show_target_time_dialog with storage tmp.fetchr:settings/dialog target_time
#NEUN_SCRIPT end
