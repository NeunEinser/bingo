#> fetchr:settings/handle_settings
#
# Function that is run when the settings trigger is changed
#
# @within function fetchr:tick/player_tick

#NEUN_SCRIPT since 77
execute \
	if score @s fetchr.settings matches 1 \
	run dialog clear @s
#NEUN_SCRIPT end
#NEUN_SCRIPT since 79
execute \
	if score @s fetchr.settings matches 2 \
	if score @s fetchr.last_tick_pause_time matches ..1 \
	run dialog show @s fetchr:custom_options

execute \
	if score @s fetchr.settings matches 3 \
	if score @s fetchr.last_tick_pause_time matches ..1 \
	run function fetchr:settings/prepare_and_show_game_settings

execute \
	if score @s fetchr.settings matches 4 \
	run function fetchr:settings/prepare_and_show_game_settings

execute \
	if score @s fetchr.settings matches 5 \
	run function fetchr:settings/generate_dynamic_quick_actions { exit_callback_setting_trigger: 2, cancel_button_translate: "back" }

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
#NEUN_SCRIPT end

#NEUN_SCRIPT since 77
execute \
	if score @s fetchr.settings matches 16 \
	unless score $game_state fetchr.state matches 4 \
	run function fetchr:card_generation/random_card
execute \
	if score @s fetchr.settings matches 16 \
	if score $game_state fetchr.state matches 4 \
	run dialog show @s fetchr:confirm_random_card_generation
execute \
	if score @s fetchr.settings matches 17 \
	run function fetchr:card_generation/random_card

execute \
	if score @s fetchr.settings matches 18 \
	unless score $game_state fetchr.state matches 4 \
	run function fetchr:lobby/settings/set_seed
execute \
	if score @s fetchr.settings matches 18 \
	if score $game_state fetchr.state matches 4 \
	run dialog show @s fetchr:confirm_card_generation_from_seed
execute \
	if score @s fetchr.settings matches 19 \
	run function fetchr:lobby/settings/set_seed

execute \
	if score @s fetchr.settings matches 20 \
	if predicate fetchr:is_in_game \
	if score $game_state fetchr.state matches 4 \
	run scoreboard players reset @s fetchr.seed

execute \
	if score @s fetchr.settings matches 21 \
	if predicate fetchr:is_in_lobby \
	run function fetchr:lobby/settings/join_game

execute \
	if score @s fetchr.settings matches 21 \
	if predicate fetchr:is_in_game \
	run function fetchr:util/go_to_lobby

execute \
	if score @s fetchr.settings matches 22 \
	if score $game_state fetchr.state matches 4 \
	run function fetchr:lobby/teleport_all

execute \
	if score @s fetchr.settings matches 22 \
	if score $game_state fetchr.state matches 2 \
	run function fetchr:game/skybox/teleport_all
execute \
	if score @s fetchr.settings matches 22 \
	if score $game_state fetchr.state matches 0 \
	run tellraw @s { translate: "fetchr.quick_actions.lobby.teleport_all.no_card", color: "red" }
execute \
	if score @s fetchr.settings matches 22 \
	if score $game_state fetchr.state matches 1 \
	run tellraw @s { translate: "fetchr.quick_actions.lobby.teleport_all.not_ready", color: "red" }
execute \
	if score @s fetchr.settings matches 22 \
	if score $game_state fetchr.state matches 3 \
	run tellraw @s { translate: "fetchr.quick_actions.lobby.teleport_all.game_starting", color: "red" }


execute \
	if score @s fetchr.settings matches 17 \
	run dialog clear @s

execute \
	if score @s fetchr.settings matches 20..21 \
	run dialog clear @s

scoreboard players reset @s fetchr.settings
#NEUN_SCRIPT end