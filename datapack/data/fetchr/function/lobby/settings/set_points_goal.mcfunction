#> fetchr:lobby/settings/set_pre_gen_radius
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the pre-gen radius setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 4
execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players enable @s fetchr.points_race_minutes

#NEUN_SCRIPT until 77
#tellraw @s [\
	"\n\n\n\n\n=== ",\
	{ "translate": "fetchr.lobby.settings.points_goal.menu.heading", "bold": true, "color": "green" },\
	" ===\n\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.off",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set -1" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set -1" }\
	}\
	, " ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["10"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 10" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 10" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["15"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 15" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 15" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["20"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 20" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 20" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["25"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 25" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 25" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["30"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 30" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 30" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["40"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 40" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 40" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["45"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 45" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 45" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.minutes",\
		"color": "#00c3ff",\
		"with": ["60"],\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.points_race_minutes set 60" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.points_race_minutes set 60" }\
	},\
	" ]\n[ ",\
	{\
		"translate": "fetchr.lobby.settings.points_goal.menu.option.custom",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.points_race_minutes set "},\
		"click_event": { "action": "suggest_command", "command": "/trigger fetchr.points_race_minutes set "}\
	},\
	"]"\
]
#NEUN_SCRIPT end

#NEUN_SCRIPT since 77
dialog show @s fetchr:points_race
#NEUN_SCRIPT end
