#> fetchr:settings/handle_settings
#
# Function that is run when the settings trigger is changed
#
# @within function fetchr:tick/player_tick

execute \
	if score @s fetchr.settings matches 1 \
	run dialog clear @s

execute \
	if score @s fetchr.settings matches 2 \
	if score @s fetchr.last_tick_pause_time matches ..1 \
	run dialog show @s fetchr:custom_options

execute \
	if score @s fetchr.settings matches 3 \
	if score @s fetchr.last_tick_pause_time matches ..1 \
	run function fetchr:settings/prepare_and_show_game_settings

execute \
	if score @s fetchr.settings matches 6 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_concealed_card

execute \
	if score @s fetchr.settings matches 7 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_lockout_mode

execute \
	if score @s fetchr.settings matches 8 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_timer_method

execute \
	if score @s fetchr.settings matches 9 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_paused_time

execute \
	if score @s fetchr.settings matches 10 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_show_seed

execute \
	if score @s fetchr.settings matches 11 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_allow_spectating

execute \
	if score @s fetchr.settings matches 12 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_operator_only

execute \
	if score @s fetchr.settings matches 13 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_gamemode

execute \
	if score @s fetchr.settings matches 14 \
	run scoreboard players set $exit_callback_setting_trigger fetchr.io 3
execute \
	if score @s fetchr.settings matches 14 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/set_points_goal

execute \
	if score @s fetchr.settings matches 15 \
	run scoreboard players set $exit_callback_setting_trigger fetchr.io 3
execute \
	if score @s fetchr.settings matches 15 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/set_pre_gen_radius

execute \
	if score @s fetchr.settings matches 6..9 \
	run function fetchr:settings/prepare_and_show_game_settings

execute \
	if score @s fetchr.settings matches 9..13 \
	if score @s fetchr.operator matches 1 \
	run function fetchr:settings/prepare_and_show_game_settings

scoreboard players reset @s fetchr.settings