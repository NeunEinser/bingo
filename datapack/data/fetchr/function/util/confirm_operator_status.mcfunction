#> fetchr:util/confirm_operator_status
#
# This function marks a player as operator 
#
# @internal
# @user

scoreboard players set @s fetchr.operator 1
tellraw @s [\
	"\n\n\n\n\n",\
	{ "translate": "fetchr.settings.operator_only.confirmation", "color": "green" },\
	"\n"\
]

execute \
	if score @s fetchr.operator_check_callback_action matches 0 \
	run function fetchr:lobby/settings/toggle_operator_only
execute \
	if score @s fetchr.operator_check_callback_action matches 1 \
	run function fetchr:card_generation/random_card
execute \
	if score @s fetchr.operator_check_callback_action matches 2 \
	run function fetchr:lobby/settings/set_seed
execute \
	if score @s fetchr.operator_check_callback_action matches 3 \
	run function fetchr:lobby/settings/toggle_concealed_card
execute \
	if score @s fetchr.operator_check_callback_action matches 4 \
	run function fetchr:lobby/settings/set_points_goal
execute \
	if score @s fetchr.operator_check_callback_action matches 5 \
	run function fetchr:lobby/settings/toggle_lockout_mode
execute \
	if score @s fetchr.operator_check_callback_action matches 6 \
	run function fetchr:lobby/settings/toggle_timer_method
execute \
	if score @s fetchr.operator_check_callback_action matches 7 \
	run function fetchr:lobby/settings/toggle_paused_time
execute \
	if score @s fetchr.operator_check_callback_action matches 8 \
	run function fetchr:lobby/settings/set_pre_gen_radius
execute \
	if score @s fetchr.operator_check_callback_action matches 9 \
	run function fetchr:lobby/settings/toggle_show_seed
execute \
	if score @s fetchr.operator_check_callback_action matches 10 \
	run function fetchr:lobby/settings/toggle_allow_spectating
execute \
	if score @s fetchr.operator_check_callback_action matches 11 \
	run function fetchr:lobby/settings/toggle_gamemode
execute \
	if score @s fetchr.operator_check_callback_action matches 12 \
	run function fetchr:game/start/start_if_ready
execute \
	if score @s fetchr.operator_check_callback_action matches 13 \
	run function fetchr:game/skybox/teleport_all
execute \
	if score @s fetchr.operator_check_callback_action matches 14 \
	run function fetchr:game/reveal_card
execute \
	if score @s fetchr.operator_check_callback_action matches 15 \
	run function fetchr:lobby/teleport_all
execute \
	if score @s fetchr.operator_check_callback_action matches 16 \
	run function fetchr:settings/prepare_and_show_game_settings

scoreboard players reset @s fetchr.operator_check_callback_action